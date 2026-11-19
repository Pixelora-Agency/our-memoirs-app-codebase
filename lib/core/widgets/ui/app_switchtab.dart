import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';

class AppSwitchTab extends StatefulWidget {
  final List<String> labels; // 👈 Label dinamis berupa list teks (misal: ['QR Code', 'Send to Email'])
  final ValueChanged<int>
  onSelectedIndexChanged; // 👈 Mengembalikan index atau string yang dipilih
  final int initialIndex;
  final double? width;

  const AppSwitchTab({
    super.key,
    required this.labels,
    required this.onSelectedIndexChanged,
    this.initialIndex = 0,
    this.width,
  }) : assert(
         labels.length == 2,
         'Labels harus berisi tepat 2 buah item untuk mode switch!',
       );

  @override
  State<AppSwitchTab> createState() => _AppSwitchTabState();
}

class _AppSwitchTabState extends State<AppSwitchTab> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: 48,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.neutral200, width: 1.2),
      ),
      child: Row(
        children: [
          // Tombol Kiri (Index 0)
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (currentIndex != 0) {
                  setState(() => currentIndex = 0);
                  widget.onSelectedIndexChanged(0); // 👈 Kirim index 0
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: currentIndex == 0
                      ? AppColors.primary700
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  widget.labels[0], // 👈 Dinamis mengambil dari list labels
                  style: AppTypography.bodyMedium.copyWith(
                    color: currentIndex == 0
                        ? Colors.white
                        : AppColors.primary700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          // Tombol Kanan (Index 1)
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (currentIndex != 1) {
                  setState(() => currentIndex = 1);
                  widget.onSelectedIndexChanged(1); // 👈 Kirim index 1
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: currentIndex == 1
                      ? AppColors.primary700
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  widget.labels[1], // 👈 Dinamis mengambil dari list labels
                  style: AppTypography.bodyMedium.copyWith(
                    color: currentIndex == 1
                        ? Colors.white
                        : AppColors.primary700,
                    fontWeight: FontWeight.w600,
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
