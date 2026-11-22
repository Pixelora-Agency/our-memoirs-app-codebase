import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:our_memoirs_codebase/app/routes/app_router.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_icons.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/utils/format_price.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_button.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_card.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_dialog.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_icon.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_textfield.dart';
import 'package:our_memoirs_codebase/core/widgets/virtual_keyboard_scaffold.dart';
import 'package:our_memoirs_codebase/features/review_order/presentation/bloc/review_order_state.dart';

import '../bloc/review_order_cubit.dart';

class ReviewOrderPage extends StatefulWidget {
  const ReviewOrderPage({super.key});

  @override
  State<ReviewOrderPage> createState() => _ReviewOrderPageState();
}

class _ReviewOrderPageState extends State<ReviewOrderPage> {
  final TextEditingController voucherController = TextEditingController();
  String _lastVoucherText = '';

  @override
  void initState() {
    super.initState();
    voucherController.addListener(() {
      final text = voucherController.text;
      if (text == _lastVoucherText) return; // kursor geser, abaikan
      _lastVoucherText = text;
      context.read<ReviewOrderCubit>().onVoucherChanged(text);
    });
  }

  @override
  void dispose() {
    voucherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.watch<ReviewOrderCubit>();

    return VirtualKeyboardScaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: BlocConsumer<ReviewOrderCubit, ReviewOrderState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              AppDialog.show(
                context,
                barrierDismissible: false,
                icon: Image.asset(
                  'assets/images/placeholder/loading.gif',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                message: "Proccesing your order",
                type: DialogType.loading,
              );
            },
            success: (qrCodeData, idOrder) {
              context.pop();

              context.go(
                AppRoutes.payment,
                extra: {'qrCodeData': qrCodeData, 'idOrder': idOrder},
              );
            },
            error: (message) {
              Navigator.pop(context);
              AppDialog.show(
                context,
                title: "Failed!",
                message: message,
                type: DialogType.error,
              );
            },
          );
        },
        builder: (context, state) {
          final currentQuantity = state.maybeWhen(
            initial: (quantity, totalPrice) => quantity,
            loaded: (quantity, totalPrice, discount) => quantity,
            orElse: () => cubit.quantity,
          );
          final currentTotalPrice = state.maybeWhen(
            initial: (quantity, totalPrice) => totalPrice,
            loaded: (quantity, totalPrice, discount) => totalPrice,
            orElse: () => cubit.totalPrice,
          );
          return Stack(
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
                          radius: 0.5,
                          colors: [
                            AppColors.primary500.withValues(alpha: 0.3),
                            AppColors.primary500.withValues(alpha: 0.0),
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
                                    "Review Your",
                                    style: AppTypography.titlePage.copyWith(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: const Offset(10, 0),
                                    child: Text(
                                      "Order",
                                      style: AppTypography.titleScriptPage
                                          .copyWith(
                                            fontSize: 96,
                                            color: theme.colorScheme.primary,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              AppCard(
                                borderRadius: 24,
                                width: 1000,
                                height:
                                    460, // naik dari 412 (nambah baris voucher)
                                padding: EdgeInsets.all(42),
                                child: SizedBox(
                                  width: 800,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 78,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 4,
                                          horizontal: 21,
                                        ),
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.onPrimary,
                                          borderRadius: BorderRadius.circular(
                                            48,
                                          ),
                                          border: Border.all(
                                            color: theme.colorScheme.primary,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                AppIcon(
                                                  AppIcons.printerIcon,
                                                  size: 48,
                                                  color: AppColors.primary700,
                                                ),
                                                const SizedBox(width: 12),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Print",
                                                      style: AppTypography
                                                          .titleMedium
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .textBase,
                                                          ),
                                                    ),
                                                    Transform.translate(
                                                      offset: const Offset(
                                                        0,
                                                        -8,
                                                      ),
                                                      child: Text(
                                                        "Select print quantity",
                                                        style: AppTypography
                                                            .titleMedium
                                                            .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  AppTypography
                                                                      .sizeSm,
                                                              color: AppColors
                                                                  .textBase,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                AppButton(
                                                  label: "-",
                                                  width: 48,
                                                  height: 41,
                                                  variant:
                                                      AppButtonVariant.outline,
                                                  onTap: () =>
                                                      cubit.decrementQuantity(),
                                                  borderRadius: 68,
                                                  padding: EdgeInsets.all(2),
                                                ),
                                                const SizedBox(width: 24),
                                                Text(
                                                  currentQuantity.toString(),
                                                  style: AppTypography
                                                      .titleMedium
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textBase,
                                                      ),
                                                ),
                                                const SizedBox(width: 24),
                                                AppButton(
                                                  label: "+",
                                                  width: 48,
                                                  height: 41,
                                                  variant:
                                                      AppButtonVariant.outline,
                                                  onTap: () =>
                                                      cubit.incrementQuantity(),
                                                  borderRadius: 68,
                                                  padding: EdgeInsets.all(2),
                                                ),
                                                const SizedBox(width: 48),
                                                Text(
                                                  formatRupiah(
                                                    cubit.pricePerItem,
                                                  ),
                                                  style: AppTypography
                                                      .titleMedium
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.textBase,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 24),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 400,
                                            height: 58,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 8,
                                              horizontal: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  theme.colorScheme.onPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(36),
                                              border: Border.all(
                                                color:
                                                    theme.colorScheme.primary,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Voucher Code ?",
                                                style: AppTypography.titleMedium
                                                    .copyWith(
                                                      color: theme
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          AppTextfield(
                                            controller: voucherController,
                                            hintText:
                                                "Input your voucher code here!",
                                            width: 500,
                                            height: 58,
                                            borderRadius: 48,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Skip, if you don't have it",
                                            style: AppTypography.bodyMedium
                                                .copyWith(
                                                  color: Color(0xFF2D2D21)
                                                      .withValues(alpha: 0.75),
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 18),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Subtotal",
                                            style: AppTypography.titleMedium
                                                .copyWith(
                                                  color: AppColors.textBase,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Text(
                                            formatRupiah(cubit.subtotal),
                                            style: AppTypography.titleMedium
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.textBase,
                                                ),
                                          ),
                                        ],
                                      ),

                                      // Baris voucher, muncul kalau kode valid
                                      if (cubit.discountPercent > 0) ...[
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Voucher ${cubit.voucherCode} (${cubit.discountPercent}%)",
                                              style: AppTypography.titleMedium
                                                  .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.textBase,
                                                  ),
                                            ),
                                            Text(
                                              "-${formatRupiah(cubit.discount)}",
                                              style: AppTypography.titleMedium
                                                  .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.textBase,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],

                                      // Garis Pemisah
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        child: Divider(
                                          thickness: 2,
                                          color: Colors.grey,
                                        ),
                                      ),

                                      // Baris Total
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total",
                                            style: AppTypography.titleMedium
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.textBase,
                                                ),
                                          ),
                                          Text(
                                            formatRupiah(currentTotalPrice),
                                            style: AppTypography.titleMedium
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.textBase,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 48),
                              AppButton(
                                label: "Proceed To Payment",
                                onTap: () => cubit.submitPayment(),
                                borderRadius: 41.5,
                                width: 579,
                                height: 85,
                                padding: EdgeInsets.symmetric(
                                  vertical: 19,
                                  horizontal: 67,
                                ),
                                textStyle: theme.textTheme.headlineMedium,
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
          );
        },
      ),
    );
  }
}
