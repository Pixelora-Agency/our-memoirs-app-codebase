import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_memoirs_codebase/features/frame_selection/data/frame_model_data.dart';

import 'camera_session_state.dart';

class CameraSessionCubit extends Cubit<CameraSessionState> {
  CameraController? controller;
  Timer? prepareTimer;
  Timer? cameraSessionTimer;
  FrameModel? currentFrame;

  bool _isInitializing = false;

  CameraSessionCubit() : super(const CameraSessionState.initial());

  void initialPrepare(FrameModel frame) async {
    if (_isInitializing) return;
    currentFrame = frame;

    emit(CameraSessionState.initial(prepareSeconds: 10));
    await initCameraOnly();
    await printAvailableCameras();
    startPrepareCountdown();
  }

  Future<void> printAvailableCameras() async {
    try {
      final cameras = await availableCameras();
      print("========================================");
      print("=== JUMLAH KAMERA TERDETEKSI: ${cameras.length} ===");

      for (int i = 0; i < cameras.length; i++) {
        print("Kamera Index [$i]:");
        print(" - Name (ID): ${cameras[i].name}");
        print(" - Lens Direction: ${cameras[i].lensDirection}");
      }
      print("========================================");
    } catch (e) {
      print("Error getting cameras: $e");
    }
  }

  Future<void> initCameraOnly() async {
    if (_isInitializing) return;
    _isInitializing = true;
    try {
      if (controller != null) {
        await controller!.dispose();
        controller = null;
      }
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        emit(const CameraSessionState.error("Camera not found"));
        return;
      }

      final selectedCamera = cameras.firstWhere((cam) {
        final name = cam.name.toLowerCase();
        return name.contains('eos') ||
            name.contains('canon') ||
            name.contains('usb video') ||
            name.contains('capture');
      }, orElse: () => cameras.length > 1 ? cameras.last : cameras.first);
      controller = CameraController(
        selectedCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await controller!.initialize();

      state.maybeMap(
        initial: (s) => emit(s.copyWith(controller: controller)),
        orElse: () {},
      );
    } catch (e) {
      print("Error init camera: $e");
    } finally {
      _isInitializing = false;
    }
  }

  void startPrepareCountdown() {
    int seconds = 10;
    prepareTimer?.cancel();

    prepareTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        state.maybeMap(
          initial: (s) => emit(s.copyWith(prepareSeconds: seconds)),
          orElse: () {},
        );
      } else {
        timer.cancel();
      }
    });
  }

  void skipAndStart() {
    prepareTimer?.cancel();
  }

  Future<void> initializeCameraAndStart() async {
    if (currentFrame == null) return;
    emit(const CameraSessionState.loading());

    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        emit(const CameraSessionState.error("Camera not found"));
        return;
      }

      final selectedCamera = cameras.firstWhere((cam) {
        final name = cam.name.toLowerCase();
        return name.contains('eos') ||
            name.contains('canon') ||
            name.contains('usb video') ||
            name.contains('capture');
      }, orElse: () => cameras.length > 1 ? cameras.last : cameras.first);
      controller = CameraController(
        selectedCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await controller!.initialize();

      final int totalSlots = currentFrame!.slotCount;

      emit(
        CameraSessionState.ready(
          controller: controller!,
          cameraName: selectedCamera.name,
          frameConfig: currentFrame!,
          totalSlots: totalSlots,
        ),
      );
    } catch (e) {
      print("Error camera $e");
    }
  }

  @override
  Future<void> close() {
    controller?.dispose();
    prepareTimer?.cancel();
    cameraSessionTimer?.cancel();
    return super.close();
  }
}
