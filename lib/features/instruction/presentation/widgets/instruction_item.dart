import 'package:flutter/material.dart';
import 'package:our_memoirs_codebase/features/instruction/data/instruction_data.dart';

class InstructionItem extends StatelessWidget {
  final Widget child;
  final ArrowDirection arrow;

  const InstructionItem({super.key, required this.child, required this.arrow});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(child: child),
        if (arrow == ArrowDirection.right)
          Positioned(
            right: -28,
            top: 0,
            bottom: 0,
            child: Center(
              child: Icon(Icons.arrow_forward, size: 20, color: color),
            ),
          ),
        if (arrow == ArrowDirection.left)
          Positioned(
            left: -28,
            top: 0,
            bottom: 0,
            child: Center(
              child: Icon(Icons.arrow_back, size: 20, color: color),
            ),
          ),
        if (arrow == ArrowDirection.down)
          Positioned(
            bottom: -28,
            left: 0,
            right: 0,
            child: Center(
              child: Icon(Icons.arrow_downward, size: 20, color: color),
            ),
          ),
      ],
    );
  }
}
