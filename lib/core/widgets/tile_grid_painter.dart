import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';

class TileGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = const Color(0xFF575757).withValues(alpha: 0.15);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      backgroundPaint,
    );

    final tilePaint = Paint()..color = AppColors.neutral50;

    double tileSize = 70.0;
    double gap = 1.2;

    for (double x = 0; x < size.width; x += tileSize) {
      for (double y = 0; y < size.height; y += tileSize) {
        canvas.drawRect(
          Rect.fromLTWH(x + gap, y + gap, tileSize - gap, tileSize - gap),
          tilePaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
