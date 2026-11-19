import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:image/image.dart' as img;

img.Image _trimBlackBorder(img.Image src, {int threshold = 20}) {
  bool isDark(img.Pixel p) =>
      p.r < threshold && p.g < threshold && p.b < threshold;

  bool rowIsBorder(int y) {
    for (int x = 0; x < src.width; x += 8) {
      if (!isDark(src.getPixel(x, y))) return false;
    }
    return true;
  }

  bool colIsBorder(int x) {
    for (int y = 0; y < src.height; y += 8) {
      if (!isDark(src.getPixel(x, y))) return false;
    }
    return true;
  }

  int top = 0, bottom = src.height - 1, left = 0, right = src.width - 1;
  while (top < bottom && rowIsBorder(top)) {
    top++;
  }
  while (bottom > top && rowIsBorder(bottom)) {
    bottom--;
  }
  while (left < right && colIsBorder(left)) {
    left++;
  }
  while (right > left && colIsBorder(right)) {
    right--;
  }

  final newW = right - left + 1;
  final newH = bottom - top + 1;
  if (newW < src.width * 0.5 || newH < src.height * 0.5) return src;

  const m = 2;
  return img.copyCrop(
    src,
    x: left + m,
    y: top + m,
    width: newW - m * 2,
    height: newH - m * 2,
  );
}

Future<void> cropToAspectRatio(String path, double targetRatio) async {
  final bytes = await File(path).readAsBytes();
  var original = img.decodeImage(bytes);
  if (original == null) {
    debugPrint('⚠️ decodeImage gagal, crop dilewati');
    return;
  }

  original = img.bakeOrientation(original);
  original = _trimBlackBorder(original); // <-- ini yang belum ada di kode lu

  final currentRatio = original.width / original.height;
  int cropW = original.width;
  int cropH = original.height;
  int x = 0, y = 0;

  if (currentRatio > targetRatio) {
    cropW = (original.height * targetRatio).round();
    x = ((original.width - cropW) / 2).round();
  } else {
    cropH = (original.width / targetRatio).round();
    y = ((original.height - cropH) / 2).round();
  }

  final cropped = img.copyCrop(
    original,
    x: x,
    y: y,
    width: cropW,
    height: cropH,
  );
  await File(path).writeAsBytes(img.encodeJpg(cropped, quality: 95));
  await FileImage(File(path)).evict();

  debugPrint('crop: ${original.width}x${original.height} -> ${cropW}x$cropH');
}
