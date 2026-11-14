import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:our_memoirs_codebase/app/routes/app_router.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/widgets/app_button.dart';
import 'package:our_memoirs_codebase/features/instruction/data/instruction_data.dart';
import 'package:our_memoirs_codebase/features/instruction/presentation/widgets/instruction_grid.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: Stack(
        children: [
          Positioned.fill(
            child: OverflowBox(
              maxWidth: 2574,
              maxHeight: 1524,
              child: SizedBox(
                width: 2574,
                height: 1524,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 0.5, // = 50% di Figma
                      colors: [
                        AppColors.primary500.withValues(alpha: 0.3), // #342114
                        AppColors.primary500.withValues(
                          alpha: 0.0,
                        ), // rgba(52,33,20,0)
                      ],
                      stops: const [0, 0.5],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 32.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Welcome to Our",
                                style: AppTypography.titlePage.copyWith(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(10, 9),
                                child: Text(
                                  "Photobooth",
                                  style: AppTypography.titleScriptPage.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Here's some instruction that can you read first.",
                            style: theme.textTheme.headlineMedium!.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 996),
                        child: InstructionGrid(items: instructions),
                      ),
                      SizedBox(height: 48),
                      AppButton(
                        label: "Ready? Here",
                        onTap: () => context.go(AppRoutes.reviewOrder),
                        borderRadius: 41.5,
                        width: 333,
                        height: 85,
                        padding: EdgeInsets.symmetric(
                          vertical: 19,
                          horizontal: 67,
                        ),
                        textStyle: theme.textTheme.headlineMedium,
                      ),
                    ],
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
