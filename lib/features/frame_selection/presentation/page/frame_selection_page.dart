import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:our_memoirs_codebase/app/routes/app_router.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/widgets/tile_grid_painter.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_button.dart';

import '../../data/frame_data.dart';
import '../bloc/frame_selection_cubit.dart';
import '../bloc/frame_selection_state.dart';
import '../widgets/frame_grid.dart';

class FrameSelectionPage extends StatelessWidget {
  const FrameSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: Stack(
        children: [
          Positioned.fill(
            top: 120.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomPaint(painter: TileGridPainter()),
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
                      Text(
                        "Select the Frame",
                        style: AppTypography.titlePage.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: AppTypography.weightMedium,
                        ),
                      ),
                      SizedBox(height: 36),
                      Row(
                        children: [
                          Container(
                            width: 904,
                            height: 644,
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xFFFCFCFC),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.10),
                                  offset: const Offset(0, 4),
                                  blurRadius: 32.0,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: BlocBuilder<FrameCubit, FrameState>(
                              builder: ((context, state) {
                                final currentSelected = state.maybeWhen(
                                  selectedFrame: (frame) => frame,
                                  orElse: () => dataFrames.first,
                                );

                                return FrameGrid(
                                  selectedId: currentSelected.id,
                                  onSelected: (frame) {
                                    context.read<FrameCubit>().selectFrame(
                                      frame,
                                    );
                                  },
                                );
                              }),
                            ),
                          ),
                          SizedBox(width: 16),
                          Container(
                            width: 346,
                            height: 644,
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xFFFCFCFC),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.10),
                                  offset: const Offset(0, 4),
                                  blurRadius: 32.0,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: BlocBuilder<FrameCubit, FrameState>(
                              builder: (context, state) {
                                final currentSelected = state.maybeWhen(
                                  selectedFrame: (frame) => frame,
                                  orElse: () => dataFrames.first,
                                );

                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Example",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),

                                    // Kotak Preview Gambar Besar
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.asset(
                                          currentSelected.imageAsset,
                                          fit: BoxFit.contain,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Center(
                                                  child: Text(
                                                    currentSelected.name,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                );
                                              },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    AppButton(
                                      label: "Start Take Photo",
                                      onTap: () {
                                        context.go(
                                          AppRoutes.cameraSession,
                                          extra: currentSelected,
                                        );
                                      },
                                      borderRadius: 100,
                                      suffixIcon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: AppColors.neutral50,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
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
