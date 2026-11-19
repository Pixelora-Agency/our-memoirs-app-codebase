import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_typo.dart';

enum AppButtonVariant { primary, outline, custom }

class AppButton extends StatefulWidget {
  final dynamic label;
  final VoidCallback onTap;
  final AppButtonVariant variant;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final bool isLoading;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
    this.variant = AppButtonVariant.primary,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = 16.0,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.padding,
    this.width,
    this.height,
    this.isLoading = false,
    this.textStyle,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color txtColor;
    Border? border;

    switch (widget.variant) {
      case AppButtonVariant.primary:
        bgColor = widget.backgroundColor ?? AppColors.primary700;
        txtColor = widget.textColor ?? AppColors.textPrimary;
        border = null;
        break;
      case AppButtonVariant.outline:
        bgColor = widget.backgroundColor ?? Colors.transparent;
        txtColor = widget.textColor ?? AppColors.primary700;
        border = Border.all(
          color: widget.borderColor ?? AppColors.primary700,
          width: 1.5,
        );
        break;
      case AppButtonVariant.custom:
        bgColor = widget.backgroundColor ?? AppColors.primary700;
        txtColor = widget.textColor ?? AppColors.textPrimary;
        border = widget.borderColor != null
            ? Border.all(color: widget.borderColor!, width: 1.5)
            : null;
        break;
    }

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: Container(
          width: widget.width ?? double.infinity,
          height: widget.height,
          padding:
              widget.padding ??
              const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: border,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.isLoading) ...[
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(txtColor),
                  ),
                ),
              ] else ...[
                if (widget.prefixIcon != null) ...[
                  widget.prefixIcon!,
                  const SizedBox(width: 8),
                ],
                if (widget.label != '') ...[
                  Flexible(
                    child: widget.label is Widget
                        ? widget.label
                        : Text(
                            widget.label.toString(),
                            style: AppTypography.titleMedium
                                .copyWith(color: txtColor)
                                .merge(widget.textStyle),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ],
                if (widget.suffixIcon != null) ...[
                  const SizedBox(width: 8),
                  widget.suffixIcon!,
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
