import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_card.dart';
import 'package:our_memoirs_codebase/features/frame_selection/data/frame_model_data.dart';

class FrameGrid extends StatelessWidget {
  final String selectedId;
  final Function(FrameModel) onSelected;

  const FrameGrid({
    super.key,
    required this.selectedId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: dataFrames.length,
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final frame = dataFrames[index];
        final isSelected = frame.id == selectedId;

        return GestureDetector(
          onTap: () => onSelected(frame),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isSelected ? AppColors.primary700 : Colors.transparent,
                width: 2.5,
              ),
            ),
            child: AppCard(
              style: CardStyle.linearGradient,
              borderRadius: 24,
              padding: EdgeInsets.all(24),
              child: Image.asset(frame.imageAsset, fit: BoxFit.contain),
            ),
          ),
        );
      },
    );
  }
}
