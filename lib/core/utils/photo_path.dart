import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future<String> getCachePhotoPath() async {
  final Directory tempDir = await getTemporaryDirectory();
  final Directory cacheFolder = Directory(
    p.join(tempDir.path, 'our_memoirs_cache'),
  );
  if (!await cacheFolder.exists()) {
    await cacheFolder.create(recursive: true);
  }

  final String fileName = 'photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
  return p.join(cacheFolder.path, fileName);
}
