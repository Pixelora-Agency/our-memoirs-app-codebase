import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';

enum CardStyle { insetDepth, linearGradient }

class AppCard extends StatelessWidget {
  final Widget child;
  final CardStyle style;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  const AppCard({
    super.key,
    required this.child,
    this.style = CardStyle.insetDepth,
    this.borderRadius = 48.0,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    List<BoxShadow>? boxShadow;
    LinearGradient? gradient;
    Border? linearBorder;

    switch (style) {
      case CardStyle.insetDepth:
        boxShadow = const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-8, -8),
            blurRadius: 16,
            spreadRadius: 0,
            inset: true,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            offset: Offset(8, 8),
            blurRadius: 16,
            spreadRadius: 0,
            inset: true,
          ),
        ];
        break;
      case CardStyle.linearGradient:
        linearBorder = Border.all(
          color: const Color.fromRGBO(52, 33, 20, 0.10),
          width: 2,
        );
        gradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(255, 255, 255, 0.10),
            Color.fromRGBO(52, 33, 20, 0.10),
          ],
        );
        break;
    }
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
        gradient: gradient,
        border: linearBorder,
      ),
      child: child,
    );
  }
}
