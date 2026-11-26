import '../models/frame_models.dart';

final List<FrameModel> dataFrames = [
  // 1. Classic Dark Lace (3 Slot Vertikal)
  const FrameModel(
    id: 'frame_01',
    name: 'Classic Dark Lace 3-Grid',
    imageAsset: 'assets/images/frames/1.png',
    slotCount: 3,
    photoPositions: [
      PhotoSlot(left: 400, top: 50, width: 610, height: 500),
      PhotoSlot(left: 400, top: 600, width: 610, height: 500),
      PhotoSlot(left: 400, top: 1110, width: 610, height: 500),
    ],
  ),

  // 2. Vintage Book Style (1 Atas, 4 Bawah/2x2 = 5 Slot)[cite: 6]
  const FrameModel(
    id: 'frame_02',
    name: 'Vintage Book Style',
    imageAsset: 'assets/images/frames/2.png',
    slotCount: 5,
    photoPositions: [
      PhotoSlot(left: 140, top: 85, width: 1020, height: 710), // Atas besar
      PhotoSlot(
        left: 140,
        top: 800,
        width: 500,
        height: 400,
      ), // Bawah kiri-atas
      PhotoSlot(
        left: 620,
        top: 800,
        width: 500,
        height: 400,
      ), // Bawah kanan-atas
      PhotoSlot(
        left: 140,
        top: 1210,
        width: 500,
        height: 400,
      ), // Bawah kiri-bawah
      PhotoSlot(
        left: 620,
        top: 1210,
        width: 500,
        height: 400,
      ), // Bawah kanan-bawah
    ],
  ),

  // 3. Red Floral Lace (3 Slot Vertikal)[cite: 7]
  const FrameModel(
    id: 'frame_03',
    name: 'Red Floral Lace',
    imageAsset: 'assets/images/frames/3.png',
    slotCount: 3,
    photoPositions: [
      PhotoSlot(left: 410, top: 50, width: 610, height: 510),
      PhotoSlot(left: 410, top: 600, width: 610, height: 510),
      PhotoSlot(left: 410, top: 1120, width: 610, height: 510),
    ],
  ),

  // 4. Pink Ribbon Dot (1 Kotak Atas, 3 Lingkaran Bawah = 4 Slot)[cite: 4]
  const FrameModel(
    id: 'frame_04',
    name: 'Pink Ribbon Dot',
    imageAsset: 'assets/images/frames/4.png',
    slotCount: 4,
    photoPositions: [
      PhotoSlot(left: 380, top: 390, width: 450, height: 450), // Kotak atas
      PhotoSlot(
        left: 60,
        top: 1080,
        width: 350,
        height: 350,
        isCircle: true,
      ), // Bulat 1
      PhotoSlot(
        left: 420,
        top: 1080,
        width: 350,
        height: 350,
        isCircle: true,
      ), // Bulat 2
      PhotoSlot(
        left: 780,
        top: 1080,
        width: 350,
        height: 350,
        isCircle: true,
      ), // Bulat 3
    ],
  ),

  // 5. Love Letter Vintage (1 Atas Besar, 2 Bawah Vertikal = 3 Slot)[cite: 9]
  const FrameModel(
    id: 'frame_05',
    name: 'Love Letter Vintage',
    imageAsset: 'assets/images/frames/5.png',
    slotCount: 3,
    photoPositions: [
      PhotoSlot(left: 45, top: 45, width: 1150, height: 710), // Atas besar
      PhotoSlot(left: 680, top: 1010, width: 440, height: 360), // Bawah kanan 1
      PhotoSlot(left: 680, top: 1350, width: 440, height: 360), // Bawah kanan 2
    ],
  ),

  // 6. Soft Pink Blossom (1 Atas Besar, 4 Bawah/2x2 = 5 Slot)[cite: 1]
  const FrameModel(
    id: 'frame_06',
    name: 'Soft Pink Blossom',
    imageAsset: 'assets/images/frames/6.png',
    slotCount: 5,
    photoPositions: [
      PhotoSlot(left: 45, top: 45, width: 1150, height: 810), // Atas besar
      PhotoSlot(left: 525, top: 1110, width: 280, height: 300), // Bawah grid 1
      PhotoSlot(left: 825, top: 1110, width: 280, height: 300), // Bawah grid 2
      PhotoSlot(left: 525, top: 1395, width: 280, height: 300), // Bawah grid 3
      PhotoSlot(left: 825, top: 1395, width: 280, height: 300), // Bawah grid 4
    ],
  ),

  // 7. Minimalist Monotone / Newspaper (1 Atas-Kanan, 2 Bawah-Kiri = 3 Slot)[cite: 2]
  const FrameModel(
    id: 'frame_07',
    name: 'Minimalist Monotone',
    imageAsset: 'assets/images/frames/7.png',
    slotCount: 5,
    photoPositions: [
      PhotoSlot(left: 610, top: 580, width: 580, height: 400),
      PhotoSlot(left: 610, top: 920, width: 580, height: 400), // Atas kanan
      PhotoSlot(left: 55, top: 1170, width: 240, height: 190),
      PhotoSlot(left: 300, top: 1170, width: 240, height: 190),
      PhotoSlot(left: 60, top: 1365, width: 500, height: 300), // Bawah kiri 2
    ],
  ),

  // 8. Retro Polaroid Grid / Folder (1 Atas-Kanan, 6 Bawah/3x2 = 7 Slot)[cite: 3]
  const FrameModel(
    id: 'frame_08',
    name: 'Retro Polaroid Grid',
    imageAsset: 'assets/images/frames/8.png',
    slotCount: 8,
    photoPositions: [
      PhotoSlot(left: 575, top: 300, width: 500, height: 550),
      PhotoSlot(left: 40, top: 700, width: 280, height: 280), // Atas kanan
      // Baris 1 Bawah (3 slot)
      PhotoSlot(left: 70, top: 1020, width: 320, height: 320),
      PhotoSlot(left: 400, top: 1020, width: 320, height: 320),
      PhotoSlot(left: 720, top: 1020, width: 320, height: 320),
      // Baris 2 Bawah (3 slot)
      PhotoSlot(left: 70, top: 1350, width: 320, height: 320),
      PhotoSlot(left: 400, top: 1350, width: 320, height: 320),
      PhotoSlot(left: 720, top: 1350, width: 320, height: 320),
    ],
  ),

  // 9. Golden Hour Aesthetic (4 Grid Atas, 1 Bawah Besar = 5 Slot)[cite: 4]
  const FrameModel(
    id: 'frame_09',
    name: 'Golden Hour Aesthetic',
    imageAsset: 'assets/images/frames/9.png',
    slotCount: 5,
    photoPositions: [
      // 4 Grid Atas (2x2)
      PhotoSlot(left: 230, top: 270, width: 365, height: 235),
      PhotoSlot(left: 600, top: 270, width: 365, height: 235),
      PhotoSlot(left: 230, top: 490, width: 365, height: 235),
      PhotoSlot(left: 600, top: 490, width: 365, height: 235),
      // 1 Bawah Besar
      PhotoSlot(left: 170, top: 860, width: 420, height: 450),
    ],
  ),

  const FrameModel(
    id: 'frame_10',
    name: 'La Galerie des Instants',
    imageAsset: 'assets/images/frames/10.png',
    orientation: FrameOrientation.landscape,
    slotCount: 5,
    photoPositions: [
      // Kiri atas
      PhotoSlot(left: 80, top: 70, width: 550, height: 450),
      // Tengah atas
      PhotoSlot(left: 660, top: 70, width: 550, height: 450),
      // Kiri bawah
      PhotoSlot(left: 80, top: 500, width: 550, height: 450),
      // Tengah bawah
      PhotoSlot(left: 660, top: 500, width: 550, height: 450),
      // Kanan atas
      PhotoSlot(left: 1340, top: 115, width: 410, height: 410),
    ],
  ),
];
