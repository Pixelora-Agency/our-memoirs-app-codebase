class PhotoSlot {
  final double left;
  final double top;
  final double width;
  final double height;
  final bool isCircle;

  const PhotoSlot({
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    this.isCircle = false,
  });
}

enum FrameOrientation { portrait, landscape }

class FrameModel {
  final String id;
  final String name;
  final String imageAsset;
  final FrameOrientation orientation;
  final int slotCount;
  final List<PhotoSlot> photoPositions; // <-- Daftar koordinat lubang foto

  const FrameModel({
    required this.id,
    required this.name,
    required this.imageAsset,
    this.orientation = FrameOrientation.portrait,
    required this.slotCount,
    required this.photoPositions,
  });
}
