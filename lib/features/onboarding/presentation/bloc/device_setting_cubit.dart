import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/device_setting_state.dart';

class DeviceSettingCubit extends Cubit<DeviceSettingState> {
  DeviceSettingCubit() : super(const DeviceSettingState());

  static const _cameraKey = 'selected_camera_name';
  static const _printerKey = 'selected_printer_name';

  CameraController? _cameraController;
  CameraController? get cameraController => _cameraController;

  bool _isInitializing = false;

  @override
  void emit(DeviceSettingState state) {
    if (isClosed) return;
    super.emit(state);
  }

  Future<void> initDevices({bool force = false}) async {
    // Kamera sudah siap? Jangan init lagi
    if (!force &&
        _cameraController != null &&
        _cameraController!.value.isInitialized &&
        state.isCameraReady) {
      debugPrint('>>> initDevices dilewati (kamera sudah siap)');
      return;
    }

    // Sedang proses init? Jangan dobel
    if (_isInitializing) {
      debugPrint('>>> initDevices dilewati (sedang berjalan)');
      return;
    }
    _isInitializing = true;

    debugPrint('>>> initDevices dipanggil');
    emit(state.copyWith(isInitializingCamera: true, errorMessage: null));

    try {
      final prefs = await SharedPreferences.getInstance();
      final savedCamera = prefs.getString(_cameraKey);
      final savedPrinter = prefs.getString(_printerKey);
      final cameras = await availableCameras();
      if (isClosed) return;

      debugPrint('===== INIT DEVICES =====');
      debugPrint('[Saved] camera : $savedCamera');
      debugPrint('[Saved] printer: $savedPrinter');

      // ---- PRINTER ----
      String? selectedPrinter;
      try {
        final printers = await Printing.listPrinters();

        debugPrint('[Printer] ditemukan ${printers.length} printer:');
        for (final p in printers) {
          debugPrint(
            '  - ${p.name} | default: ${p.isDefault} | available: ${p.isAvailable}',
          );
        }

        final physicalNames = await _getPhysicalPrinterNames();
        final physical = printers.where((p) {
          if (physicalNames != null) return physicalNames.contains(p.name);
          return !_isVirtualPrinterByName(p.name); // fallback
        }).toList();

        debugPrint(
          '[Printer] fisik terdeteksi: ${physical.map((p) => p.name).toList()}',
        );

        final saved = physical.where((p) => p.name == savedPrinter);
        final defaults = physical.where((p) => p.isDefault);

        String source;
        if (saved.isNotEmpty) {
          selectedPrinter = saved.first.name;
          source = 'tersimpan';
        } else if (defaults.isNotEmpty) {
          selectedPrinter = defaults.first.name;
          source = 'default sistem (fisik)';
        } else if (physical.isNotEmpty) {
          selectedPrinter = physical.first.name;
          source = 'printer fisik pertama';
        } else {
          selectedPrinter = null;
          source = 'tidak ada printer fisik';
        }

        debugPrint('[Printer] terpilih: $selectedPrinter (dari $source)');

        if (selectedPrinter != null && selectedPrinter != savedPrinter) {
          await prefs.setString(_printerKey, selectedPrinter);
          debugPrint('[Printer] disimpan ke SharedPreferences');
        }
      } catch (e) {
        debugPrint('[Printer] gagal ambil daftar printer: $e');
        selectedPrinter = null;
      }

      if (isClosed) return;

      // ---- KAMERA ----
      debugPrint('[Camera] ditemukan ${cameras.length} kamera:');
      for (final c in cameras) {
        debugPrint('  - ${c.name} | lens: ${c.lensDirection.name}');
      }

      if (cameras.isEmpty) {
        debugPrint('[Camera] tidak ada kamera yang terdeteksi');
        emit(
          state.copyWith(
            cameras: cameras,
            selectedPrinter: selectedPrinter,
            isInitializingCamera: false,
            errorMessage: 'Tidak ada kamera yang tersedia',
          ),
        );
        return;
      }

      final savedMatch = cameras.where((cam) => cam.name == savedCamera);
      final selectedCamera = savedMatch.isNotEmpty
          ? savedMatch.first
          : cameras.first;

      debugPrint(
        '[Camera] terpilih: ${selectedCamera.name} '
        '(dari ${savedMatch.isNotEmpty ? 'tersimpan' : 'kamera pertama'})',
      );

      emit(
        state.copyWith(
          cameras: cameras,
          selectedPrinter: selectedPrinter,
          isInitializingCamera: false,
        ),
      );

      await selectCamera(selectedCamera, saveToPrefs: true, force: force);
      debugPrint('===== INIT DEVICES SELESAI =====');
    } catch (e) {
      debugPrint('[initDevices] ERROR: $e');
      emit(
        state.copyWith(
          isInitializingCamera: false,
          errorMessage: 'Gagal memuat perangkat: $e',
        ),
      );
    } finally {
      _isInitializing = false;
    }
  }

  Future<void> selectCamera(
    CameraDescription camera, {
    bool saveToPrefs = true,
    bool force = false,
  }) async {
    if (isClosed) return;

    // Kamera yang sama sudah aktif? Jangan init ulang
    if (!force &&
        _cameraController != null &&
        _cameraController!.value.isInitialized &&
        state.selectedCamera?.name == camera.name) {
      debugPrint('[Camera] ${camera.name} sudah aktif, skip');
      return;
    }

    emit(
      state.copyWith(
        isInitializingCamera: true,
        isCameraReady: false,
        errorMessage: null,
      ),
    );

    final old = _cameraController;
    _cameraController = null;
    await old?.dispose();

    final controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await controller.initialize();

      // Cubit ditutup selagi kamera masih menyala: matikan, jangan bocor
      if (isClosed) {
        await controller.dispose();
        return;
      }

      _cameraController = controller;

      if (saveToPrefs) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_cameraKey, camera.name);
      }

      emit(
        state.copyWith(
          selectedCamera: camera,
          isCameraReady: true,
          isInitializingCamera: false,
        ),
      );
    } catch (e) {
      await controller.dispose();
      emit(
        state.copyWith(
          selectedCamera: camera,
          isCameraReady: false,
          isInitializingCamera: false,
          errorMessage: 'Gagal menyalakan kamera: $e',
        ),
      );
    }
  }

  // 3. Simpan pilihan printer
  Future<void> selectPrinter(String printerName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_printerKey, printerName);
    emit(state.copyWith(selectedPrinter: printerName));
  }

  /// Mengembalikan nama printer fisik saja (berdasarkan port).
  /// Return null kalau gagal, supaya bisa fallback ke filter nama.
  Future<Set<String>?> _getPhysicalPrinterNames() async {
    if (!Platform.isWindows) return null;

    try {
      final result = await Process.run('powershell', [
        '-NoProfile',
        '-Command',
        'Get-Printer | Select-Object Name,PortName | ConvertTo-Json -Compress',
      ]);

      if (result.exitCode != 0) return null;

      final output = (result.stdout as String).trim();
      if (output.isEmpty) return <String>{};

      final decoded = jsonDecode(output);
      // PowerShell mengembalikan object tunggal kalau cuma 1 printer
      final list = decoded is List ? decoded : [decoded];

      const virtualPorts = [
        'portprompt',
        'nul',
        'file:',
        'shrfax',
        'xpsport',
        'microsoft.office',
        'onenote',
        'pdf',
      ];

      final names = <String>{};
      for (final item in list) {
        final name = item['Name'] as String? ?? '';
        final port = (item['PortName'] as String? ?? '').toLowerCase();
        final isVirtual = virtualPorts.any(port.contains);
        if (!isVirtual && name.isNotEmpty) names.add(name);
      }

      debugPrint('[Printer] printer fisik (via port): $names');
      return names;
    } catch (e) {
      debugPrint('[Printer] gagal cek port printer: $e');
      return null;
    }
  }

  /// Fallback kalau PowerShell gagal
  bool _isVirtualPrinterByName(String name) {
    final n = name.toLowerCase();
    const keywords = ['pdf', 'xps', 'onenote', 'fax', 'microsoft print'];
    return keywords.any(n.contains);
  }

  @override
  Future<void> close() async {
    final c = _cameraController;
    _cameraController = null;
    await c?.dispose();
    return super.close();
  }
}
