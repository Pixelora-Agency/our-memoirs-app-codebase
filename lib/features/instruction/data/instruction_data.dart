import 'package:our_memoirs_codebase/core/constants/app_icons.dart';

enum ArrowDirection { none, left, right, down }

const List<Map<String, dynamic>> instructions = [
  {
    "title": "Pay First",
    "subTitle": "Supported with QRIS",
    "icon": AppIcons.outlineScan,
    "arrow": ArrowDirection.right,
  },
  {
    "title": "Select the Frame",
    "subTitle": "With 10+ Frame for You",
    "icon": AppIcons.nounFilm,
    "arrow": ArrowDirection.right,
  },
  {
    "title": "Background Arrange",
    "subTitle": "You can arrange the props",
    "icon": AppIcons.nounBackground,
    "arrow": ArrowDirection.down,
  },

  // Baris 2: tampil kiri ke kanan = 6, 5, 4 (alur kanan ke kiri)
  {
    "title": "Choose Filter",
    "subTitle": "What tone you want to use?",
    "icon": AppIcons.fillStart,
    "arrow": ArrowDirection.down,
  },
  {
    "title": "1x Retry",
    "subTitle": "Don't like the photo? Try 1x more",
    "icon": AppIcons.outlineSpin,
    "arrow": ArrowDirection.left,
  },
  {
    "title": "Prepare For Shooting",
    "subTitle": "Prepare, we'll wait to 5 Second",
    "icon": AppIcons.outlineCamera,
    "arrow": ArrowDirection.left,
  },

  // Baris 3: 7 -> 8 -> 9
  {
    "title": "Printing",
    "subTitle": "Supported with QRIS",
    "icon": AppIcons.outlineScan,
    "arrow": ArrowDirection.right,
  },
  {
    "title": "Don't Forget to Follow",
    "subTitle": "@ourmemoirs.booth",
    "icon": AppIcons.nounFilm,
    "arrow": ArrowDirection.right,
  },
  {
    "title": "Act the props properly",
    "subTitle": "Please take care the props carefully",
    "icon": AppIcons.nounBackground,
    "arrow": ArrowDirection.none,
  },
];
