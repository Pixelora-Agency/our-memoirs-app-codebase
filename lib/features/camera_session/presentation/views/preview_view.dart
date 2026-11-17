import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_icons.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_button.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_icon.dart';
import 'package:our_memoirs_codebase/features/frame_selection/models/frame_models.dart';
import 'package:our_memoirs_codebase/features/frame_selection/presentation/widgets/frame_preview.dart';

class PreviewView extends StatelessWidget {
  final FrameModel frame;
  final List<XFile?> capturedPhotos;
  final VoidCallback? onMirrorPressed;
  final VoidCallback? onPressedPrint;
  final bool isMirrored;

  const PreviewView({
    super.key,
    required this.frame,
    required this.capturedPhotos,
    this.onMirrorPressed,
    this.onPressedPrint,
    this.isMirrored = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> imagePaths = capturedPhotos
        .where((photo) => photo != null)
        .map((photo) => photo!.path)
        .toList();
    return Container(
      color: theme.colorScheme.onPrimary,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: OverflowBox(
              maxWidth: 2574,
              maxHeight: 1524,
              child: SizedBox(
                width: 2574,
                height: 1524,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 0.5,
                      colors: [
                        AppColors.primary500.withValues(alpha: 0.3), // #342114
                        AppColors.primary500.withValues(alpha: 0.0),
                      ],
                      stops: const [0, 0.5],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 320,
            child: Transform.rotate(
              angle: -0.2,
              child: SizedBox(
                height: 400,
                width: 250,
                child: AspectRatio(
                  aspectRatio: 1200 / 1800, // Rasio standar photobox
                  child: FramePreview(
                    frame: frame,
                    capturedImagePaths: imagePaths,
                    totalSlots: frame.photoPositions.length,
                    chanceRetake: 2,
                    isMirrored: isMirrored, // Pastikan total slot dikirim
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 320,
            child: Transform.rotate(
              angle: 0.2,
              child: SizedBox(
                height: 400,
                width: 250,
                child: AspectRatio(
                  aspectRatio: 1200 / 1800, // Rasio standar photobox
                  child: FramePreview(
                    frame: frame,
                    capturedImagePaths: imagePaths,
                    totalSlots: frame.photoPositions.length,
                    chanceRetake: 2,
                    isMirrored: isMirrored, // Pastikan total slot dikirim
                  ),
                ),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(color: AppColors.neutral50.withValues(alpha: 0.1)),
          ),
          SafeArea(
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 32.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Result!",
                        style: AppTypography.titlePage.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      AppButton(
                        width: 135,
                        height: 40,
                        label: "Mirror",
                        borderRadius: 100,
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 6,
                        ),
                        onTap: onMirrorPressed ?? () {},
                        suffixIcon: Icon(
                          Icons.flip,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 14),
                      SizedBox(
                        height: 500,
                        width: 360,
                        child: AspectRatio(
                          aspectRatio: 1200 / 1800, // Rasio standar photobox
                          child: FramePreview(
                            frame: frame,
                            capturedImagePaths: imagePaths,
                            totalSlots: frame.photoPositions.length,
                            chanceRetake: 2,
                            isMirrored:
                                isMirrored, // Pastikan total slot dikirim
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      AppButton(
                        width: 579,
                        height: 72,
                        label: "Print",
                        borderRadius: 100,
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 4,
                        ),
                        onTap: onPressedPrint ?? () {},
                        prefixIcon: AppIcon(
                          AppIcons.printerIcon,
                          size: 24,
                          color: AppColors.neutral50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
