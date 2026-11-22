import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:our_memoirs_codebase/app/routes/app_router.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_button.dart';

import '../bloc/device_setting_cubit.dart';
import '../widgets/settings.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  void _openSettingsDialog(BuildContext context) {
    final deviceSettingCubit = context.read<DeviceSettingCubit>();

    showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: deviceSettingCubit,
          child: Dialog(
            backgroundColor: AppColors.neutral50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 420),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SettingsWidgets(),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/bg.jpg', fit: BoxFit.cover),
          ),
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
                        theme.primaryColor, // #342114
                        theme.primaryColor.withValues(
                          alpha: 0.0,
                        ), // rgba(52,33,20,0)
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                ),
              ),
            ),
          ),

          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeIn,
            builder: (context, value, child) {
              return Opacity(opacity: value, child: child);
            },
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 32.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Our", style: theme.textTheme.displayLarge),
                        Transform.translate(
                          offset: const Offset(10, 30),
                          child: Text(
                            'Memoirs',
                            style: AppTypography.displayScript,
                          ),
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(
                        0,
                        -20,
                      ), // Tarik teks subtitle-nya ke atas secara aman
                      child: Text(
                        'Build Your Own Memories',
                        style: TextStyle(
                          fontSize: AppTypography.size3xl,
                          fontFamily: AppTypography.primaryFont,
                          letterSpacing: AppTypography.trackingLarge,
                          fontWeight: AppTypography.weightMedium,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Center(
                      child: SizedBox(
                        width: 220,
                        child: AppButton(
                          label: 'Tap to Start',
                          variant: AppButtonVariant.outline,
                          backgroundColor: theme.colorScheme.onPrimary,
                          textColor: theme.colorScheme.primary,
                          borderColor: theme.colorScheme.primary,
                          borderRadius: 100,
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
                          suffixIcon: Icon(
                            Icons.arrow_outward_rounded,
                            size: 28,
                            color: theme.colorScheme.primary,
                          ),
                          onTap: () => context.go(AppRoutes.instruction),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 24,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onDoubleTap: () => _openSettingsDialog(context),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [SizedBox(width: 72, height: 72)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
