import 'package:flutter/material.dart';
// Sesuaikan import di bawah ini dengan lokasi file AppColors & AppTypography kamu
import 'package:our_memoirs_codebase/core/constants/app_colors.dart';
import 'package:our_memoirs_codebase/core/constants/app_typo.dart';

class AppCustomKeyboard extends StatefulWidget {
  final Function(String) onKeyPressed;
  final VoidCallback onBackspace;
  final VoidCallback onClose;
  final VoidCallback? onSubmit;

  const AppCustomKeyboard({
    super.key,
    required this.onKeyPressed,
    required this.onBackspace,
    required this.onClose,
    this.onSubmit,
  });

  @override
  State<AppCustomKeyboard> createState() => _AppCustomKeyboardState();
}

class _AppCustomKeyboardState extends State<AppCustomKeyboard> {
  bool _isUpperCase = false;
  bool _isSymbolMode = false;

  @override
  Widget build(BuildContext context) {
    // Layout Huruf & Angka
    final letterRows = [
      ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
      ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
      ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
      ['SHIFT', 'z', 'x', 'c', 'v', 'b', 'n', 'm', 'BACKSPACE'],
    ];

    // Layout Simbol (berguna untuk input email, harga, atau kode)
    final symbolRows = [
      ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
      ['@', '#', '\$', '%', '&', '-', '_', '+', '(', ')'],
      ['*', '"', '\'', ':', ';', '!', '?', '/', '\\'],
      ['ABC', ',', '.', '=', '[', ']', '{', '}', 'BACKSPACE'],
    ];

    final activeRows = _isSymbolMode ? symbolRows : letterRows;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary900,
        border: Border(
          top: BorderSide(
            color: AppColors.accentGold.withValues(alpha: 0.45),
            width: 1.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ==================== HEADER BAR ====================
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.accentGold,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'TOUCH KEYBOARD',
                style: TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: AppTypography.sizeXs,
                  fontWeight: AppTypography.weightBold,
                  color: AppColors.textSecondary,
                  letterSpacing: 1.5,
                ),
              ),
              const Spacer(),
              // Tombol Tutup Keyboard
              Material(
                color: AppColors.primary800,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: widget.onClose,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primary600),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.keyboard_hide_rounded,
                          color: AppColors.accentGold,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Tutup',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: AppTypography.sizeXs,
                            fontWeight: AppTypography.weightMedium,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ==================== BARIS TOMBOL UTAMA ====================
          for (var row in activeRows)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: row.map((key) {
                  return _buildKeyButton(key);
                }).toList(),
              ),
            ),

          // ==================== BARIS BAWAH (MODE, SPASI, DONE) ====================
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol Toggle Simbol (?123 / ABC)
                _buildSpecialButton(
                  width: 85,
                  bgColor: AppColors.primary700,
                  borderColor: AppColors.primary500,
                  onTap: () {
                    setState(() {
                      _isSymbolMode = !_isSymbolMode;
                    });
                  },
                  child: Text(
                    _isSymbolMode ? 'ABC' : '?123',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: AppTypography.sizeSm,
                      fontWeight: AppTypography.weightBold,
                      color: AppColors.accentGold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Tombol Spasi
                _buildSpecialButton(
                  width: 340,
                  bgColor: AppColors.primary800,
                  borderColor: AppColors.primary600,
                  onTap: () => widget.onKeyPressed(' '),
                  child: Text(
                    'Space',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: AppTypography.sizeSm,
                      fontWeight: AppTypography.weightMedium,
                      color: AppColors.textSecondary,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Tombol Selesai / Enter (Aksen Emas)
                _buildSpecialButton(
                  width: 110,
                  bgColor: AppColors.accentGold,
                  borderColor: AppColors.accentGold,
                  onTap: () {
                    if (widget.onSubmit != null) {
                      widget.onSubmit!();
                    } else {
                      widget.onClose();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.check_rounded,
                        color: AppColors.primary900,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Done',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: AppTypography.sizeSm,
                          fontWeight: AppTypography.weightBold,
                          color: AppColors.primary900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk tombol huruf, angka, shift, dan backspace
  Widget _buildKeyButton(String key) {
    // 1. Tombol SHIFT
    if (key == 'SHIFT') {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: _buildSpecialButton(
          width: 75,
          bgColor: _isUpperCase ? AppColors.accentGold : AppColors.primary700,
          borderColor: _isUpperCase
              ? AppColors.accentGold
              : AppColors.primary500,
          onTap: () {
            setState(() {
              _isUpperCase = !_isUpperCase;
            });
          },
          child: Icon(
            Icons.arrow_upward_rounded,
            color: _isUpperCase ? AppColors.primary900 : AppColors.accentGold,
            size: 22,
          ),
        ),
      );
    }

    // 2. Tombol BACKSPACE
    if (key == 'BACKSPACE') {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: _buildSpecialButton(
          width: 75,
          bgColor: AppColors.primary700,
          borderColor: AppColors.primary500,
          onTap: widget.onBackspace,
          child: const Icon(
            Icons.backspace_outlined,
            color: AppColors.accentGold,
            size: 20,
          ),
        ),
      );
    }

    // 3. Tombol ABC (kembali dari mode simbol)
    if (key == 'ABC') {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: _buildSpecialButton(
          width: 75,
          bgColor: AppColors.primary700,
          borderColor: AppColors.primary500,
          onTap: () {
            setState(() {
              _isSymbolMode = false;
            });
          },
          child: Text(
            'ABC',
            style: TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: AppTypography.sizeSm,
              fontWeight: AppTypography.weightBold,
              color: AppColors.accentGold,
            ),
          ),
        ),
      );
    }

    // 4. Tombol Karakter Normal
    final displayChar = (!_isSymbolMode && _isUpperCase)
        ? key.toUpperCase()
        : key;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: _buildSpecialButton(
        width: 54, // Ukuran nyaman untuk jari touchscreen desktop
        bgColor: AppColors.primary800,
        borderColor: AppColors.primary600,
        onTap: () => widget.onKeyPressed(displayChar),
        child: Text(
          displayChar,
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: AppTypography.sizeLg, // 24.0 agar jelas terbaca di layar
            fontWeight: AppTypography.weightMedium,
            color: AppColors.textPrimary,
            letterSpacing: AppTypography.trackingNormal,
          ),
        ),
      ),
    );
  }

  // Helper container tombol dengan efek sentuh
  Widget _buildSpecialButton({
    required double width,
    required Color bgColor,
    required Color borderColor,
    required VoidCallback onTap,
    required Widget child,
  }) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        splashColor: AppColors.accentGold.withValues(alpha: 0.25),
        highlightColor: AppColors.primary500.withValues(alpha: 0.4),
        onTap: onTap,
        child: Container(
          width: width,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: borderColor, width: 1),
          ),
          child: child,
        ),
      ),
    );
  }
}
