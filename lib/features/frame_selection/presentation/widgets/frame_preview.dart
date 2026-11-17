import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/frame_models.dart';

class FramePreview extends StatelessWidget {
  final FrameModel frame;
  final List<String> capturedImagePaths;
  final int? chanceRetake;
  final int? totalSlots;
  final bool? isMirrored;

  final Function(int index)? onSlotTapped;

  const FramePreview({
    super.key,
    required this.frame,
    required this.capturedImagePaths,
    this.isMirrored = false,
    this.chanceRetake,
    this.totalSlots,
    this.onSlotTapped,
  });

  bool get isPhotoFull =>
      capturedImagePaths.length >= (totalSlots ?? frame.photoPositions.length);

  @override
  Widget build(BuildContext context) {
    const double designWidth = 1200;
    const double designHeight = 1800;

    final bool afterTakePhoto = isPhotoFull && (chanceRetake ?? 0) == 0;

    return AspectRatio(
      aspectRatio: designWidth / designHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double scaleX = constraints.maxWidth / designWidth;
          double scaleY = constraints.maxHeight / designHeight;

          return Stack(
            children: [
              for (int i = 0; i < frame.photoPositions.length; i++)
                Positioned(
                  left: frame.photoPositions[i].left * scaleX,
                  top: frame.photoPositions[i].top * scaleY,
                  width: frame.photoPositions[i].width * scaleX,
                  height: frame.photoPositions[i].height * scaleY,
                  child: GestureDetector(
                    onTap: () {
                      if (!isPhotoFull || chanceRetake != 0) return;
                      if (onSlotTapped != null) {
                        onSlotTapped!(i);
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        frame.photoPositions[i].isCircle ? 1000 : 0,
                      ),
                      child: SizedBox.expand(
                        child: Container(
                          color: Colors.grey[400],
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: i < capturedImagePaths.length
                                ? Stack(
                                    children: [
                                      SizedBox.expand(
                                        key: ValueKey(capturedImagePaths[i]),
                                        child: Transform(
                                          alignment: Alignment.center,
                                          transform: (isMirrored ?? false)
                                              ? (Matrix4.identity()
                                                  ..scale(-1.0, 1.0, 1.0))
                                              : Matrix4.identity(),
                                          child: Image.file(
                                            File(capturedImagePaths[i]),
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                            gaplessPlayback: true,
                                          ),
                                        ),
                                      ),
                                      afterTakePhoto
                                          ? Center(
                                              child: Icon(
                                                Icons.refresh_outlined,
                                                color: Colors.white54,
                                                size: 32,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  )
                                : const Center(
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white54,
                                      size: 32,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              IgnorePointer(
                child: Image.asset(
                  frame.imageAsset,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
