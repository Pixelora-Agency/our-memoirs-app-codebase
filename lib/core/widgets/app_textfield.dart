import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';

class AppTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color borderColor;
  final Color backgroundColor;
  final ValueChanged<String>? onSubmitted;
  final double? width;
  final double? height;

  const AppTextfield({
    super.key,
    this.controller,
    required this.hintText,
    this.borderRadius = 24,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    this.prefixWidget,
    this.suffixWidget,
    this.borderColor = AppColors.primary700,
    this.backgroundColor = Colors.white,
    this.onSubmitted,
    this.width = double.infinity,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        onSubmitted: onSubmitted,
        style: AppTypography.titleMedium.copyWith(color: AppColors.primary700),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTypography.titleMedium.copyWith(
            color: Colors.black.withValues(alpha: 0.24),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: prefixWidget,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),

          suffixIcon: suffixWidget,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),

          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
