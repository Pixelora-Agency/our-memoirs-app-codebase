import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:our_memoirs_codebase/app/routes/app_router.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_dialog.dart';

import '../bloc/camera_session_cubit.dart';
import '../bloc/camera_session_state.dart';
import '../views/camera_session_view.dart';
import '../views/prepare_view.dart';
import '../views/preview_view.dart';

class CameraSessionPage extends StatelessWidget {
  const CameraSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<CameraSessionCubit, CameraSessionState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              AppDialog.show(
                context,
                title: "Failed!",
                message: message,
                type: DialogType.error,
                onError: () => context.go(AppRoutes.frameSelection),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: state.maybeWhen(
              initial: (prepareSeconds, frameName, controller) {
                if (controller == null || !controller.value.isInitialized) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }

                return PrepareView(
                  key: const ValueKey('prepare_view'),
                  prepareSeconds: prepareSeconds,
                  frameName: frameName!,
                  controller: controller,
                  onStartPressed: () {
                    context.read<CameraSessionCubit>().skipAndStart();
                  },
                );
              },
              ready:
                  (
                    controller,
                    cameraName,
                    frameConfig,
                    slotCountdown,
                    currentSlotIndex,
                    totalSlots,
                    capturedPhotos,
                    isTakingPicture,
                    chanceRetake,
                  ) => CameraSessionView(
                    key: const ValueKey('camera_view'),
                    controller: controller,
                    frameConfig: frameConfig,
                    currentSlotIndex: currentSlotIndex,
                    totalSlots: totalSlots,
                    slotCountdown: slotCountdown,
                    capturedPhotos: capturedPhotos,
                    isTakingPicture: isTakingPicture,
                    chanceRetake: chanceRetake,
                    onCapturePressed: () {
                      context
                          .read<CameraSessionCubit>()
                          .takePictureForCurrentSlot();
                    },
                    onSlotTapped: (index) {
                      context.read<CameraSessionCubit>().retakePhotoAt(index);
                    },
                    onPrintPreview: () {
                      context.read<CameraSessionCubit>().gotPrintPreview();
                    },
                  ),
              print: (frameConfig, capturedPhotos, mirrorImg) => PreviewView(
                key: const ValueKey('preview_view'),
                frame: frameConfig,
                capturedPhotos: capturedPhotos,
                isMirrored: mirrorImg,
                onMirrorPressed: () {
                  context.read<CameraSessionCubit>().toggleMirrorImage();
                },
              ),
              orElse: () => const Center(
                key: ValueKey('loading_default'),
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
