import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';
import 'package:our_memoirs_codebase/core/widgets/ui/app_button.dart';

enum DialogType { loading, success, error, confirm }

class DialogSubHeader {
  final Widget icon;
  final String title;
  final String subTitle;

  const DialogSubHeader({
    required this.icon,
    required this.title,
    required this.subTitle,
  });
}

class AppDialog extends StatefulWidget {
  final Widget? icon;
  final String? title;
  final String? message;
  final DialogType type;

  final String? confirmText;
  final String? canceText;
  final DialogSubHeader? subHeader;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final VoidCallback? onError;

  final Widget? footer;

  const AppDialog({
    super.key,
    this.icon,
    this.title,
    this.message,
    required this.type,
    this.subHeader,
    this.confirmText,
    this.canceText,
    this.onConfirm,
    this.onCancel,
    this.onError,
    this.footer,
  });

  static void show(
    BuildContext context, {
    Widget? icon,
    String? title,
    String? message,
    required DialogType type,
    String? confirmText,
    String? cancelText,
    DialogSubHeader? subHeader,

    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    VoidCallback? onError,
    Widget? footer,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppDialog(
        icon: icon,
        title: title,
        message: message,
        subHeader: subHeader,
        type: type,
        confirmText: confirmText,
        canceText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        onError: onError,
        footer: footer,
      ),
    );
  }

  @override
  State<AppDialog> createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 290),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.subHeader != null) ...[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.subHeader!.icon,
                        const SizedBox(width: 8),

                        Text(
                          widget.subHeader!.title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: AppTypography.weightMedium,
                            color: AppColors.primary700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.subHeader!.subTitle,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: AppTypography.weightRegular,
                        color: AppColors.primary700,
                      ),
                    ),
                  ],
                ),
              ],
              if (widget.type == DialogType.loading) ...[
                widget.icon != null
                    ? widget.icon!
                    : Padding(
                        padding: const EdgeInsets.all(36),
                        child: SizedBox(
                          width: 48,
                          height: 48,
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.primary,
                            strokeWidth: 4,
                          ),
                        ),
                      ),
              ] else if (widget.icon != null) ...[
                if (widget.type == DialogType.confirm) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: widget.icon,
                  ),
                ] else ...[
                  widget.icon!,
                ],
              ],
              if (widget.title != null) ...[
                Text(
                  widget.title ?? '',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: AppTypography.sizeXl,
                    fontWeight: AppTypography.weightMedium,
                    height: AppTypography.leadingTight,
                    letterSpacing: AppTypography.trackingSmall,
                  ),
                ),
              ],
              if (widget.message != null) ...[
                Text(
                  widget.message ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 16,
                    fontWeight: AppTypography.weightMedium,
                    height: AppTypography.leadingTight,
                    letterSpacing: AppTypography.trackingSmall,
                  ),
                ),
              ],
              if (widget.footer != null) ...[
                widget.footer!,
              ] else ...[
                if (widget.type == DialogType.confirm) ...[
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          width: 100,
                          height: 45,
                          label: widget.canceText,
                          backgroundColor: theme.colorScheme.primary.withValues(
                            alpha: 0.1,
                          ),
                          textColor: theme.colorScheme.primary,
                          borderRadius: 100,
                          padding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 4,
                          ),
                          textStyle: AppTypography.bodyMedium.copyWith(
                            color: AppColors.primary700,
                          ),
                          onTap:
                              widget.onCancel ?? () => Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppButton(
                          width: 145,
                          height: 45,
                          padding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 4,
                          ),
                          label: widget.confirmText,
                          borderRadius: 100,
                          onTap: widget.onConfirm!,
                          textStyle: AppTypography.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ] else if (widget.type == DialogType.success ||
                    widget.type == DialogType.error) ...[
                  const SizedBox(height: 24),
                  AppButton(
                    label: "Ok",
                    borderRadius: 100,
                    onTap: () {
                      if (widget.onError != null) {
                        widget.onError!();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
