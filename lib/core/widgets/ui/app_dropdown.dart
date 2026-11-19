import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';

class Item {
  final String label;
  final String value;

  const Item({required this.label, required this.value});
}

class AppDropdown extends StatefulWidget {
  final List<Item> item;
  final ValueChanged<String?> onSelected;
  final String initialValue;
  final double? width;

  const AppDropdown({
    super.key,
    required this.item,
    required this.onSelected,
    required this.initialValue,
    this.width,
  });

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  late String selectedValue;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  // Fungsi manual untuk memunculkan pop-up menu secara presisi di bawah widget
  void _showCustomMenu(BuildContext context) async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    setState(() => isOpen = true);

    final String? result = await showMenu<String>(
      context: context,
      // Mengatur posisi menu agar muncul tepat di bawah kotak dropdown
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + size.height + 8,
        offset.dx + size.width,
        offset.dy + size.height,
      ),

      constraints: BoxConstraints(minWidth: size.width, maxWidth: size.width),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppColors.neutral50,
      elevation: 4,
      items: widget.item.map((Item item) {
        final isSelected = item.value == selectedValue;
        return PopupMenuItem<String>(
          value: item.value,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.neutral300 : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              item.label,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.primary700,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );

    setState(() => isOpen = false);

    if (result != null) {
      setState(() {
        selectedValue = result;
      });
      widget.onSelected(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () =>
            _showCustomMenu(context), // 👈 Panggil fungsi pop-up di sini
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.neutral50,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.neutral200, width: 1.2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.item
                      .firstWhere(
                        (e) => e.value == selectedValue,
                        orElse: () => widget.item.first,
                      )
                      .label,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.primary700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              AnimatedRotation(
                turns: isOpen ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: AppColors.primary700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
