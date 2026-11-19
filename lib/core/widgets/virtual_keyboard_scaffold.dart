import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_memoirs_codebase/core/bloc/keyboard_cubit.dart';

import 'ui/app_customkeyboard.dart';

class VirtualKeyboardScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Color? backgroundColor;

  const VirtualKeyboardScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KeyboardCubit(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: BlocBuilder<KeyboardCubit, KeyboardState>(
          builder: (context, state) {
            final isKeyboardVisible = state is KeyboardVisible;
            final keyboardCubit = context.read<KeyboardCubit>();

            return Stack(
              children: [
                // 1. BODY TETAP DIAM (TANPA ANIMATED PADDING)
                Positioned.fill(
                  child: AbsorbPointer(
                    absorbing: isKeyboardVisible,
                    child: body,
                  ),
                ),

                // 2. KLIK DI LUAR KEYBOARD UNTUK MENUTUP (TRANSPARAN)
                if (isKeyboardVisible)
                  Positioned.fill(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        keyboardCubit.hideKeyboard();
                      },
                      child: const SizedBox.expand(),
                    ),
                  ),

                // 3. KEYBOARD DI LAYER PALING ATAS (SEPERTI Z-INDEX TERTINGGI)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 220),
                    transitionBuilder: (child, animation) {
                      return SlideTransition(
                        position:
                            Tween<Offset>(
                              begin: const Offset(0, 1),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOutCubic,
                              ),
                            ),
                        child: child,
                      );
                    },
                    child: isKeyboardVisible
                        ? Material(
                            key: const ValueKey('keyboard_visible'),
                            elevation: 16.0,
                            child: AppCustomKeyboard(
                              onKeyPressed: (val) =>
                                  keyboardCubit.insertText(val),
                              onBackspace: () => keyboardCubit.backspace(),
                              onClose: () => keyboardCubit.hideKeyboard(),
                              onSubmit: () => keyboardCubit.hideKeyboard(),
                            ),
                          )
                        : const SizedBox.shrink(
                            key: ValueKey('keyboard_hidden'),
                          ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
