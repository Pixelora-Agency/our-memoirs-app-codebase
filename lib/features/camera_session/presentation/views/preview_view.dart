import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:our_memoirs_codebase/app/routes/app_router.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_icons.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/utils/format_time.dart';
import 'package:our_memoirs_codebase/core/utils/printer_service.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_button.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_dialog.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_icon.dart';
import 'package:our_memoirs_codebase/features/frame_selection/models/frame_models.dart';
import 'package:our_memoirs_codebase/features/frame_selection/presentation/widgets/frame_preview.dart';
import 'package:screenshot/screenshot.dart';

class PreviewView extends StatefulWidget {
  final FrameModel frame;
  final List<XFile?> capturedPhotos;
  final VoidCallback? onMirrorPressed;
  final bool isMirrored;

  const PreviewView({
    super.key,
    required this.frame,
    required this.capturedPhotos,
    this.onMirrorPressed,
    this.isMirrored = false,
  });

  @override
  State<PreviewView> createState() => _PreviewViewState();
}

class _PreviewViewState extends State<PreviewView> {
  final ScreenshotController screenshotController = ScreenshotController();

  bool isPrinting = false;
  bool isSuccess = false;
  int seconds = 5;
  Timer? timer;
  String? imagePaths;
  StateSetter? dialogStateSetter;
  bool isLandscape = false;

  void countDown(String? path) {
    timer?.cancel();
    setState(() {
      seconds = 5;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() => seconds--);
        if (dialogStateSetter != null) {
          dialogStateSetter!(() {});
        }
      } else {
        timer.cancel();
        Navigator.of(context).pop();
        context.go(
          AppRoutes.result,
          extra: {
            'path': path,
            'isLandscape':
                widget.frame.orientation == FrameOrientation.landscape,
          },
        );
      }
    });
  }

  Future<void> captureAndPrint() async {
    setState(() {
      isPrinting = true;
      isSuccess = false;
    });

    AppDialog.show(
      context,
      barrierDismissible: false,
      subHeader: DialogSubHeader(
        icon: AppIcon(
          AppIcons.printerIcon,
          size: 24,
          color: AppColors.primary700,
        ),
        title: "Printing",
        subTitle: "This process may take few minutes",
      ),
      icon: Image.asset(
        'assets/images/placeholder/loading.gif',
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
      type: DialogType.loading,
    );

    String? errorMessage;

    try {
      final Uint8List? imageBytes = await screenshotController.capture(
        pixelRatio: 3.0,
      );

      if (imageBytes != null && mounted) {
        imagePaths = await PrinterService.printPhotoboxImage(
          imageBytes,
          isLandscape,
        );
        setState(() {
          isSuccess = true;
        });
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      debugPrint(" Error printing :$e");
      isSuccess = false;
      errorMessage = e.toString();
    } finally {
      if (mounted) {
        Navigator.of(context).pop();
        setState(() {
          isPrinting = false;
        });

        if (isSuccess) {
          countDown(imagePaths);
          AppDialog.show(
            context,
            barrierDismissible: false,
            subHeader: DialogSubHeader(
              icon: AppIcon(
                AppIcons.printerIcon,
                size: 24,
                color: AppColors.primary700,
              ),
              title: "Success",
              subTitle:
                  "You can save your photo online or share it to friends!",
            ),
            icon: Image.asset(
              'assets/images/placeholder/loading.gif',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            footer: StatefulBuilder(
              builder: (context, setDialogState) {
                dialogStateSetter = setDialogState;
                return Text(
                  "Redirecting in ${formatTime(seconds)}",
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.primary700,
                  ),
                );
              },
            ),
            type: DialogType.success,
          );
        } else {
          AppDialog.show(
            context,
            barrierDismissible: true,
            subHeader: DialogSubHeader(
              icon: AppIcon(
                AppIcons.printerIcon,
                size: 24,
                color: AppColors.primary700,
              ),
              title: "Printing Failed",
              subTitle: errorMessage ?? "Something went wrong.",
            ),
            type: DialogType.error,
          );
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    isLandscape = widget.frame.orientation == FrameOrientation.landscape;

    final List<String> imagePaths = widget.capturedPhotos
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
            bottom: isLandscape ? 150 : 100,
            left: isLandscape ? 250 : 320,
            child: Transform.rotate(
              angle: -0.2,
              child: SizedBox(
                height: isLandscape ? 300 : 400,
                width: isLandscape ? 450 : 250,
                child: AspectRatio(
                  aspectRatio: isLandscape
                      ? 1800 / 1200
                      : 1200 / 1800, // Rasio standar photobox
                  child: FramePreview(
                    frame: widget.frame,
                    capturedImagePaths: imagePaths,
                    totalSlots: widget.frame.photoPositions.length,
                    chanceRetake: 2,
                    isMirrored:
                        widget.isMirrored, // Pastikan total slot dikirim
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: isLandscape ? 150 : 100,
            right: isLandscape ? 250 : 320,
            child: Transform.rotate(
              angle: 0.2,
              child: SizedBox(
                height: isLandscape ? 300 : 400,
                width: isLandscape ? 450 : 250,
                child: AspectRatio(
                  aspectRatio: isLandscape
                      ? 1800 / 1200
                      : 1200 / 1800, // Rasio standar photobox
                  child: FramePreview(
                    frame: widget.frame,
                    capturedImagePaths: imagePaths,
                    totalSlots: widget.frame.photoPositions.length,
                    chanceRetake: 2,
                    isMirrored:
                        widget.isMirrored, // Pastikan total slot dikirim
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
                        onTap: widget.onMirrorPressed ?? () {},
                        suffixIcon: Icon(
                          Icons.flip,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 14),
                      SizedBox(
                        height: isLandscape ? 450 : 500,
                        width: isLandscape ? 650 : 360,
                        child: Screenshot(
                          controller: screenshotController,
                          child: AspectRatio(
                            aspectRatio: isLandscape
                                ? (1800 / 1200)
                                : (1200 / 1800), // Rasio standar photobox
                            child: FramePreview(
                              frame: widget.frame,
                              capturedImagePaths: imagePaths,
                              totalSlots: widget.frame.photoPositions.length,
                              chanceRetake: 2,
                              isMirrored: widget
                                  .isMirrored, // Pastikan total slot dikirim
                            ),
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
                        onTap: captureAndPrint,
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
