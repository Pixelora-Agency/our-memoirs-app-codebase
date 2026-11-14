class FrameModel {
  final String id;
  final String name;
  final String imageAsset;
  final int slotCount;
  final Map<String, dynamic>? photoPositions;
  final String? styleType;

  const FrameModel({
    required this.id,
    required this.name,
    required this.imageAsset,
    required this.slotCount,
    this.photoPositions,
    this.styleType,
  });
}

final List<FrameModel> dataFrames = [
  const FrameModel(
    id: 'frame_01',
    name: 'Classic Dark Lace 3-Grid',
    imageAsset: 'assets/images/frames/1.png',
    slotCount: 3,
    photoPositions: null,
    styleType: null,
  ),
  const FrameModel(
    id: 'frame_02',
    name: 'Vintage Book Style',
    imageAsset: 'assets/images/frames/2.png',
    slotCount: 4,
    photoPositions: null,
    styleType: null,
  ),
  const FrameModel(
    id: 'frame_03',
    name: 'Red Floral Lace',
    imageAsset: 'assets/images/frames/3.png',
    slotCount: 3,
    photoPositions: null,
    styleType: null,
  ),
  const FrameModel(
    id: 'frame_04',
    name: 'Pink Ribbon Dot',
    imageAsset: 'assets/images/frames/4.png',
    slotCount: 4,
    photoPositions: null,
    styleType: null,
  ),
  const FrameModel(
    id: 'frame_05',
    name: 'Love Letter Vintage',
    imageAsset: 'assets/images/frames/5.png',
    slotCount: 2,
    photoPositions: null,
    styleType: null,
  ),
  const FrameModel(
    id: 'frame_06',
    name: 'Soft Pink Blossom',
    imageAsset: 'assets/images/frames/6.png',
    slotCount: 2,
    photoPositions: null,
    styleType: null,
  ),
  const FrameModel(
    id: 'frame_07',
    name: 'Minimalist Monotone',
    imageAsset: 'assets/images/frames/7.png',
    slotCount: 3,
    photoPositions: null,
    styleType: null,
  ),
  const FrameModel(
    id: 'frame_08',
    name: 'Retro Polaroid Grid',
    imageAsset: 'assets/images/frames/8.png',
    slotCount: 4,
    photoPositions: null,
    styleType: null,
  ),
  const FrameModel(
    id: 'frame_09',
    name: 'Golden Hour Aesthetic',
    imageAsset: 'assets/images/frames/9.png',
    slotCount: 3,
    photoPositions: null,
    styleType: null,
  ),
];
