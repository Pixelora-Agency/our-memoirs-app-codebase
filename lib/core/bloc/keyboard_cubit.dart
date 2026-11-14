import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'keyboard_state.dart';

class KeyboardCubit extends Cubit<KeyboardState> {
  KeyboardCubit() : super(KeyboardHidden());

  // Menyimpan TextField yang sedang aktif disentuh
  TextEditingController? activeController;

  // 1. Munculkan keyboard & set target controller
  void showKeyboard(TextEditingController controller) {
    activeController = controller;
    emit(KeyboardVisible());
  }

  // 2. Sembunyikan keyboard & bersihkan target
  void hideKeyboard() {
    activeController = null;
    emit(KeyboardHidden());
  }

  // 3. Logika memasukkan teks ke TextField aktif
  void insertText(String value) {
    if (activeController == null) return;
    final text = activeController!.text;
    final selection = activeController!.selection;

    if (selection.isValid) {
      final newText =
          selection.textBefore(text) + value + selection.textAfter(text);
      activeController!.text = newText;
      activeController!.selection = TextSelection.collapsed(
        offset: selection.start + value.length,
      );
    } else {
      activeController!.text = text + value;
      activeController!.selection = TextSelection.collapsed(
        offset: activeController!.text.length,
      );
    }
  }

  // 4. Logika tombol hapus (Backspace)
  void backspace() {
    if (activeController == null) return;
    final text = activeController!.text;
    final selection = activeController!.selection;

    if (selection.isValid && selection.isCollapsed && selection.start > 0) {
      final newText =
          text.substring(0, selection.start - 1) +
          text.substring(selection.start);
      activeController!.text = newText;
      activeController!.selection = TextSelection.collapsed(
        offset: selection.start - 1,
      );
    } else if (!selection.isValid && text.isNotEmpty) {
      activeController!.text = text.substring(0, text.length - 1);
      activeController!.selection = TextSelection.collapsed(
        offset: activeController!.text.length,
      );
    }
  }
}
