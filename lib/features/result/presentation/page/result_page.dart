import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:our_memoirs_codebase/app/routes/app_router.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_icons.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/utils/format_time.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_button.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_card.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_dialog.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_dropdown.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_icon.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_switchtab.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_textfield.dart';
import 'package:our_memoirs_codebase/core/widgets/virtual_keyboard_scaffold.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../bloc/result_cubit.dart';
import '../bloc/result_state.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final TextEditingController emailController = TextEditingController();

    return VirtualKeyboardScaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: BlocConsumer<ResultCubit, ResultState>(
        listener: (context, state) {
          state.maybeMap((value) {
            if (value.timerCountdown == 0) {
              context.go(AppRoutes.onboarding);
              return;
            }
          }, orElse: () {});
          state.maybeWhen(
            null,
            loading: () {},
            success: () {},
            error: (message) {},
            orElse: () {},
          );
        },
        builder: (context, state) {
          final cubit = context.read<ResultCubit>();
          return state.maybeMap((value) {
            final imagePath = value.imagePaths;
            final selectedAction = value.selectedAction;
            final qrCodeUrl = selectedAction == 'download'
                ? value.downloadUrl
                : value.shareUrl;
            final toggleQrcode = value.isQrMode;
            final timer = value.timerCountdown;

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
                              AppColors.primary500.withValues(
                                alpha: 0.3,
                              ), // #342114
                              AppColors.primary500.withValues(alpha: 0.0),
                            ],
                            stops: const [0, 0.5],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 150,
                  child: Transform.rotate(
                    angle: -0.2,
                    child: SizedBox(
                      height: 450,
                      width: 260,
                      child: AspectRatio(
                        aspectRatio: 1200 / 1800, // Rasio standar photobox
                        child: Image.file(File(imagePath)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 450,
                  child: Transform.rotate(
                    angle: 0.2,
                    child: SizedBox(
                      height: 450,
                      width: 260,
                      child: AspectRatio(
                        aspectRatio: 1200 / 1800, // Rasio standar photobox
                        child: Image.file(File(imagePath)),
                      ),
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    color: AppColors.neutral50.withValues(alpha: 0.1),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: -35,
                  child: Transform.rotate(
                    angle: 0,
                    child: SizedBox(
                      width: size.width * 0.7, // 35% dari lebar layar
                      height: size.height * 0.9,
                      child: AspectRatio(
                        aspectRatio: 1200 / 1800, // Rasio standar photobox
                        child: Image.file(File(imagePath)),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 48, horizontal: 48),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 700),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Final",
                                  style: AppTypography.titlePage.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(10, 9),
                                  child: Text(
                                    "Magic",
                                    style: AppTypography.titleScriptPage
                                        .copyWith(
                                          color: theme.colorScheme.primary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppDropdown(
                                    item: const [
                                      Item(
                                        label: 'Download Image',
                                        value: 'download',
                                      ),
                                      Item(label: 'Send Image', value: 'send'),
                                    ],
                                    initialValue: selectedAction,
                                    onSelected: (String? selectedValue) {
                                      if (selectedValue != null) {
                                        cubit.changeAction(selectedValue);
                                      }
                                    },
                                  ),

                                  const SizedBox(height: 8),
                                  AppSwitchTab(
                                    labels: const ['QR Code', 'Send to Email'],
                                    initialIndex: value.isQrMode ? 0 : 1,
                                    onSelectedIndexChanged: (int index) {
                                      cubit.toggleAction(index);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            AnimatedSize(
                              duration: const Duration(milliseconds: 280),
                              curve: Curves.easeInOutCubic,
                              alignment: Alignment.topCenter,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 320),
                                switchOutCurve: const Interval(
                                  0.0,
                                  0.3,
                                  curve: Curves.easeOut,
                                ),
                                switchInCurve: const Interval(
                                  0.3,
                                  1.0,
                                  curve: Curves.easeIn,
                                ),
                                transitionBuilder: (child, animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                layoutBuilder:
                                    (currentChild, previousChildren) {
                                      return Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          ...previousChildren,
                                          if (currentChild != null)
                                            currentChild,
                                        ],
                                      );
                                    },
                                child: toggleQrcode
                                    ? Padding(
                                        key: const ValueKey('qr_view'),
                                        padding: const EdgeInsets.only(top: 24),
                                        child: AppCard(
                                          padding: const EdgeInsets.all(24),
                                          child: QrImageView(
                                            data: qrCodeUrl.toString(),
                                            version: QrVersions.auto,
                                            size: 250,
                                            foregroundColor:
                                                theme.colorScheme.primary,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        key: const ValueKey('email_view'),
                                        padding: const EdgeInsets.only(top: 24),
                                        child: SizedBox(
                                          width: 300,

                                          child: AppTextfield(
                                            controller: emailController,
                                            hintText: 'example@gmail.com',
                                            height: 46,
                                            borderRadius: 16,
                                            borderColor: AppColors.neutral200,
                                            padding: const EdgeInsets.only(
                                              left: 12,
                                              top: 6,
                                              bottom: 6,
                                              right: 6, // lebih kecil dari kiri (12)
                                            ),
                                            style: AppTypography.bodyMedium
                                                .copyWith(
                                                  color: AppColors.primary700,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            hintStyle: AppTypography.bodyMedium
                                                .copyWith(
                                                  color: AppColors.neutral200,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            align: TextAlign.start,
                                            suffixWidget: AppButton(
                                              label: "",
                                              width: 34,
                                              height: 36,
                                              borderRadius: 12,
                                              backgroundColor:
                                                  AppColors.neutral200,
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                                top: 0,
                                                bottom: 0,
                                                right: 3, // lebih kecil dari kiri (12)
                                              ),
                                              onTap: () {},
                                              suffixIcon: Icon(
                                                Icons.send,
                                                size: 12,
                                                color: AppColors.primary700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Back in ${formatTime(timer)}",
                                  style: AppTypography.bodyMedium.copyWith(
                                    color: AppColors.primary700,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 24),
                                AppButton(
                                  width: 140,
                                  height: 44,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 6,
                                  ),
                                  label: "I'm Done",
                                  suffixIcon: Icon(
                                    Icons.arrow_outward_rounded,
                                    size: 20,
                                    color: theme.colorScheme.onPrimary,
                                  ),
                                  onTap: () {
                                    AppDialog.show(
                                      context,
                                      title: "Are you sure?",
                                      message: "Scan or save the link first, if not, you can't get the QR back",
                                      confirmText: "Continue",
                                      cancelText: "Back",
                                      icon: AppIcon(
                                        AppIcons.outlineWarning,
                                        size: 64,
                                        color: AppColors.primary700,
                                      ),
                                      onConfirm: () =>
                                          context.go(AppRoutes.onboarding),
                                      type: DialogType.confirm,
                                    );
                                  },
                                  borderRadius: 100,
                                  textStyle: AppTypography.bodyMedium.copyWith(
                                    color: AppColors.neutral200,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }, orElse: () => const SizedBox.shrink());
        },
      ),
    );
  }
}
