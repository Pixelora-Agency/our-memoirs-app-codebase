import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_card.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_icon.dart';
import 'package:our_memoirs_codebase/features/instruction/data/instruction_data.dart';

import 'instruction_item.dart';

class InstructionGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const InstructionGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 996),
      child: Wrap(
        spacing: 30,
        runSpacing: 30,
        alignment: WrapAlignment.center,
        children: [
          for (final item in items)
            SizedBox(
              width: 300,
              height: 150,
              child: InstructionItem(
                arrow: item['arrow'] as ArrowDirection,
                child: AppCard(
                  style: CardStyle.insetDepth,
                  borderRadius: 24,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcon(item['icon'], size: 32, color: colors.primary),
                      SizedBox(height: 12),
                      Text(
                        item['title'] as String,
                        style: AppTypography.titleMedium.copyWith(
                          color: colors.primary,
                          fontWeight: AppTypography.weightMedium,
                        ),
                      ),
                      Text(
                        item['subTitle'] as String,
                        style: TextStyle(
                          color: colors.primary,
                          fontSize: AppTypography.sizeMd,
                          fontWeight: AppTypography.weightRegular,
                          letterSpacing: AppTypography.trackingBody,
                          height: AppTypography.leadingNormal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
