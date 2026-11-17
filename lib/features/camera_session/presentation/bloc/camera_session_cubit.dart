import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_memoirs_codebase/core/utils/crop_photo_ratio.dart';
import 'package:our_memoirs_codebase/core/utils/photo_path.dart';
import 'package:our_memoirs_codebase/features/frame_selection/models/frame_models.dart';

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

    emit(const CameraSessionState.loading());

    await initCameraOnly();
  }

  // Future<void> printAvailableCameras() async {
  //   try {
  //     final cameras = await availableCameras();
  //     print("========================================");
  //     print("=== JUMLAH KAMERA TERDETEKSI: ${cameras.length} ===");

  //     for (int i = 0; i < cameras.length; i++) {
  //       print("Kamera Index [$i]:");
  //       print(" - Name (ID): ${cameras[i].name}");
  //       print(" - Lens Direction: ${cameras[i].lensDirection}");
  //     }
  //     print("========================================");
  //   } catch (e) {
  //     print("Error getting cameras: $e");
  //   }
  // }

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
      emit(
        CameraSessionState.initial(
          prepareSeconds: 10,
          frameName: currentFrame?.name,
          controller: controller,
        ),
      );

      startPrepareCountdown();
    } catch (e) {
      print("Error init camera: $e");
      if (controller != null) {
        await controller!.dispose();
        controller = null;
      }
      emit(CameraSessionState.error("Failed Connect Camera"));
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
        emit(
          CameraSessionState.ready(
            controller: controller!,
            cameraName: controller?.description.name ?? 'External Camera',
            frameConfig: currentFrame!,
            totalSlots: currentFrame!.slotCount,
          ),
        );

        startSlotCountdown();
      }
    });
  }

  void skipAndStart() {
    prepareTimer?.cancel();
    emit(
      CameraSessionState.ready(
        controller: controller!,
        cameraName: controller?.description.name ?? 'External Camera',
        frameConfig: currentFrame!,
        totalSlots: currentFrame!.slotCount,
      ),
    );

    startSlotCountdown();
  }

  void startSlotCountdown() {
    cameraSessionTimer?.cancel();

    state.maybeMap(
      ready: (currentState) {
        int countdown = 10;
        emit(currentState.copyWith(slotCountdown: countdown));
        cameraSessionTimer = Timer.periodic(const Duration(seconds: 1), (
          timer,
        ) async {
          if (countdown > 1) {
            countdown--;
            emit(currentState.copyWith(slotCountdown: countdown));
          } else {
            timer.cancel();
            await takePictureForCurrentSlot();
          }
        });
      },

      orElse: () {},
    );
  }

  Future<void> takePictureForCurrentSlot() async {
    if (controller == null || !controller!.value.isInitialized) return;

    final currentState = state.maybeMap(ready: (s) => s, orElse: () => null);
    final AudioPlayer audioPlayer = AudioPlayer();

    if (currentState == null || currentState.isTakingPicture) return;

    emit(currentState.copyWith(isTakingPicture: true));

    try {
      await audioPlayer.play(AssetSource('audio/camera-shutter.mp3'));
      final XFile rawImage = await controller!.takePicture();

      if (isClosed) return;

      final String savePath = await getCachePhotoPath();
      await rawImage.saveTo(savePath);

      final slot = currentState
          .frameConfig
          .photoPositions[currentState.currentSlotIndex];
      final slotRatio = slot.width / slot.height;
      await cropToAspectRatio(savePath, slotRatio);

      final updatePhotos = List<XFile?>.from(currentState.capturedPhotos);

      if (currentState.currentSlotIndex < updatePhotos.length) {
        updatePhotos[currentState.currentSlotIndex] = XFile(savePath);
      } else {
        updatePhotos.add(XFile(savePath));
      }

      final int nextIndex = currentState.currentSlotIndex + 1;

      state.maybeMap(
        ready: (s) {
          if (s.chanceRetake == 0 && nextIndex < s.totalSlots) {
            emit(
              s.copyWith(
                capturedPhotos: updatePhotos,
                currentSlotIndex: nextIndex,
                isTakingPicture: false,
                slotCountdown: 10,
              ),
            );

            startSlotCountdown();
          } else {
            emit(
              s.copyWith(
                capturedPhotos: updatePhotos,
                isTakingPicture: false,
                chanceRetake: s.chanceRetake == 1 ? 2 : 0,
              ),
            );
            print("🎉 Sesi foto selesai! Semua slot sudah terisi.");
          }
        },
        orElse: () {},
      );
    } catch (e) {
      print("❌ Error capturing image: $e");

      if (isClosed) return;

      state.maybeMap(
        ready: (s) {
          emit(s.copyWith(isTakingPicture: false));
          startSlotCountdown();
        },
        orElse: () {},
      );
    }
  }

  void retakePhotoAt(int index) {
    state.maybeMap(
      ready: (currentState) {
        if (currentState.chanceRetake >= 2) return;
        cameraSessionTimer?.cancel();
        emit(
          currentState.copyWith(
            currentSlotIndex: index,
            slotCountdown: 10,
            chanceRetake: 1,
          ),
        );
        startSlotCountdown();
      },
      orElse: () {},
    );
  }

  void gotPrintPreview() {
    state.maybeMap(
      ready: (currentState) {
        cameraSessionTimer?.cancel();
        currentState.controller.dispose();

        emit(
          CameraSessionState.print(
            frameConfig: currentState.frameConfig,
            capturedPhotos: currentState.capturedPhotos,
            mirrorImg: false,
          ),
        );
      },
      orElse: () {},
    );
  }

  void toggleMirrorImage() {
    state.maybeMap(
      print: (printState) {
        emit(printState.copyWith(mirrorImg: !printState.mirrorImg));
      },
      orElse: () {},
    );
  }

  @override
  Future<void> close() {
    controller?.dispose();
    prepareTimer?.cancel();
    cameraSessionTimer?.cancel();
    return super.close();
  }
}
