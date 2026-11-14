import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:our_memoirs_codebase/app/routes/app_router.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/utils/format_time.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_card.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_dialog.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../bloc/payment_cubit.dart';
import '../bloc/payment_state.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final String qrCodeData = extra?['qrCodeData'] ?? '';
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              AppDialog.show(
                context,
                title: "Processing Payment",
                message: "Please wait while we process your payment...",
                type: DialogType.loading,
                barrierDismissible: false,
              );
            },
            success: () {
              context.go(AppRoutes.frameSelection);
            },
            error: (message) async {
              AppDialog.show(
                context,
                title: "Failed!",
                message: message,
                type: DialogType.error,
              );
              context.pop();
            },
            expired: () async {
              AppDialog.show(
                context,
                title: "Timeoutiled!",
                message: "Your payment session has expired.",
                type: DialogType.error,
              );
              await Future.delayed(const Duration(seconds: 2));
              if (context.mounted) {
                context.go(AppRoutes.reviewOrder);
              }
            },
          );
        },
        builder: (context, state) {
          final currentSeconds = state.maybeWhen(
            initial: (seconds) => seconds,
            countdown: (seconds) => seconds,
            orElse: () => 240,
          );
          return SafeArea(
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
                          Container(
                            width: 125,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: theme.colorScheme.primary,
                            ),
                            child: Center(
                              child: Text(
                                "Payment",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  height: AppTypography.leadingTight,
                                  letterSpacing: AppTypography.trackingBtn,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Your",
                                style: AppTypography.titlePage.copyWith(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(10, 9),
                                child: Text(
                                  "Journey",
                                  style: AppTypography.titleScriptPage.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                "Starts Here!",
                                style: AppTypography.titlePage.copyWith(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "To Start, Scan the QRIS Below",
                            style: theme.textTheme.headlineMedium!.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 32),
                          AppCard(
                            borderRadius: 24,
                            width: 396,
                            height: 577,
                            padding: const EdgeInsets.all(48),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                QrImageView(
                                  data: qrCodeData,
                                  version: QrVersions.auto,
                                  size: 300,
                                  foregroundColor: theme.colorScheme.primary,
                                ),
                                SizedBox(height: 48),
                                Text(
                                  "[QRIS BANK]",
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Timer",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: AppColors.textBase,
                                    fontWeight: AppTypography.weightBold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  formatTime(currentSeconds),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: AppColors.textBase,
                                    fontWeight: AppTypography.weightBold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 1600,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      context.go(AppRoutes.frameSelection),
                                  child: Text(
                                    "Skip to Select Frame",
                                    style: theme.textTheme.headlineSmall
                                        ?.copyWith(color: AppColors.primary700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
