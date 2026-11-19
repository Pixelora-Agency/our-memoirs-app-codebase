import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/utils/format_time.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_button.dart';
import 'package:our_memoirs_codebase/features/frame_selection/models/frame_models.dart';
import 'package:our_memoirs_codebase/features/frame_selection/presentation/widgets/frame_preview.dart';

class CameraSessionView extends StatelessWidget {
  final CameraController controller;
  final FrameModel frameConfig;
  final int slotCountdown;
  final int currentSlotIndex;
  final int totalSlots;
  final List<XFile?> capturedPhotos;
  final bool isTakingPicture;
  final int chanceRetake;
  final VoidCallback? onCapturePressed;
  final VoidCallback? onPrintPreview;
  final Function(int index)? onSlotTapped;

  const CameraSessionView({
    super.key,
    required this.controller,
    required this.frameConfig,
    required this.slotCountdown,
    required this.currentSlotIndex,
    required this.totalSlots,
    required this.capturedPhotos,
    required this.isTakingPicture,
    required this.chanceRetake,
    this.onPrintPreview,
    this.onSlotTapped,
    this.onCapturePressed,
  });

  @override
  Widget build(BuildContext context) {
    final int filledPhotosCount = capturedPhotos
        .where((photo) => photo != null)
        .length;
    final bool afterTakePhoto =
        (filledPhotosCount < totalSlots) || chanceRetake == 1;

    final List<String> imagePaths = capturedPhotos
        .where((photo) => photo != null)
        .map((photo) => photo!.path)
        .toList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (controller.value.isInitialized)
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: controller.value.aspectRatio > 0
                      ? controller.value.aspectRatio
                      : 16 / 9,
                  height: 1.0,
                  child: CameraPreview(controller),
                ),
              ),
            )
          else
            Container(color: Colors.black),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(color: Colors.black.withValues(alpha: 0.3)),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 750,
                            height: 555,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: AspectRatio(
                                aspectRatio: controller.value.aspectRatio > 0
                                    ? controller.value.aspectRatio
                                    : 5 / 4,
                                child: CameraPreview(controller),
                              ),
                            ),
                          ),

                          Positioned.fill(
                            child: IgnorePointer(
                              child: AnimatedOpacity(
                                opacity: isTakingPicture ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 100),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 24),
                      Container(
                        width: 400,
                        height: 555,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              alignment: Alignment.center,
                              child: Center(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    AnimatedOpacity(
                                      opacity: afterTakePhoto ? 1.0 : 0.0,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Remaining Time",
                                            textAlign: TextAlign.center,
                                            style: AppTypography.titleMedium,
                                          ),
                                          SizedBox(height: 4),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 14,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withValues(
                                                alpha: 0.2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Text(
                                              slotCountdown == 1
                                                  ? "Cheese!"
                                                  : formatTime(slotCountdown),
                                              textAlign: TextAlign.center,
                                              style: AppTypography.titleMedium,
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                        ],
                                      ),
                                    ),
                                    AnimatedOpacity(
                                      opacity: chanceRetake == 2 ? 1.0 : 0.0,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Done!",
                                            textAlign: TextAlign.center,
                                            style: AppTypography.heading3,
                                          ),
                                          Text(
                                            "Please click the button below to continue.",
                                            textAlign: TextAlign.center,
                                            style: AppTypography.bodyMedium,
                                          ),
                                          SizedBox(height: 12),
                                        ],
                                      ),
                                    ),
                                    AnimatedOpacity(
                                      opacity:
                                          filledPhotosCount >= totalSlots &&
                                              chanceRetake == 0
                                          ? 1.0
                                          : 0.0,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Done!",
                                            textAlign: TextAlign.center,
                                            style: AppTypography.heading3,
                                          ),
                                          Text(
                                            "You can retake by simply click on image",
                                            textAlign: TextAlign.center,
                                            style: AppTypography.bodyMedium,
                                          ),
                                          SizedBox(height: 12),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              height: 380,
                              width: 280,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: FramePreview(
                                frame: frameConfig,
                                capturedImagePaths: imagePaths,
                                onSlotTapped: onSlotTapped,
                                totalSlots: totalSlots,
                                chanceRetake: chanceRetake,
                              ),
                            ),
                            if ((filledPhotosCount >= totalSlots &&
                                    chanceRetake == 0) ||
                                chanceRetake == 2) ...[
                              SizedBox(height: 12),
                              AppButton(
                                label: "I'm Done",
                                width: 170,
                                variant: AppButtonVariant.outline,
                                backgroundColor: AppColors.neutral100,
                                textColor: AppColors.primary700,
                                borderColor: AppColors.primary700,
                                borderRadius: 100,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                suffixIcon: Icon(
                                  Icons.arrow_outward_rounded,
                                  size: 24,
                                  color: AppColors.primary700,
                                ),
                                onTap: onPrintPreview ?? () {},
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
