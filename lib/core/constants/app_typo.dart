import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  // ==================== 1. FONT FAMILIES ====================
  static String get primaryFont => GoogleFonts.dmSans().fontFamily!;
  static String get scriptFont => GoogleFonts.pinyonScript().fontFamily!;

  // ==================== 2. FONT SIZES ====================
  static const double sizeXs = 12.0;
  static const double sizePayment = 12.0;
  static const double sizeSm = 14.0;
  static const double sizeMd = 16.0;
  static const double sizeLg = 24.0;
  static const double sizeXl = 32.0;
  static const double size2xl = 36.0;
  static const double size3xl = 48.0;
  static const double size4xl = 64.0;
  static const double size5xl = 128.0;

  // ==================== 3. FONT WEIGHTS ====================
  static const FontWeight weightRegular = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightBold = FontWeight.w700;

  // ==================== 4. LETTER SPACINGS (TRACKING) ====================
  static const double trackingTight = -2.56;
  static const double trackingMedium = -1.44;
  static const double trackingSmall = -1.28;
  static const double trackingLarge = -1.92;
  static const double trackingBtn = -0.96;
  static const double trackingBody = -0.64;
  static const double trackingNormal = 0.0;

  // ==================== 5. LINE HEIGHTS (LEADING) ====================
  static const double leadingNormal = 1.0; // normal
  static const double leadingTight = 1.2; // 120%

  // ==================== 6. TYPOGRAPHY STYLES ====================

  static TextStyle titlePage = TextStyle(
    fontFamily: primaryFont,
    fontSize: size4xl,
    fontWeight: weightMedium,
    letterSpacing: trackingTight,
    height: leadingTight,
  );

  static TextStyle titleScriptPage = TextStyle(
    fontFamily: scriptFont,
    fontSize: size4xl,
    fontWeight: weightMedium,
    letterSpacing: trackingTight,
    height: leadingTight,
  );

  static TextStyle displayHero = TextStyle(
    fontFamily: primaryFont,
    fontSize: size5xl,
    fontWeight: weightRegular,
    letterSpacing: trackingNormal,
    height: null,
  );

  static TextStyle displayScript = TextStyle(
    fontFamily: scriptFont,
    fontSize: size5xl,
    fontWeight: weightRegular,
    letterSpacing: trackingNormal,
    height: null,
  );

  static TextStyle heading1 = TextStyle(
    fontFamily: primaryFont,
    fontSize: size3xl,
    fontWeight: weightMedium,
    letterSpacing: trackingTight,
    height: leadingTight,
  );

  static TextStyle heading2 = TextStyle(
    fontFamily: primaryFont,
    fontSize: size2xl,
    fontWeight: weightRegular,
    letterSpacing: trackingMedium,
    height: leadingTight,
  );

  static TextStyle heading3 = TextStyle(
    fontFamily: primaryFont,
    fontSize: sizeXl,
    fontWeight: weightMedium,
    letterSpacing: trackingSmall,
    height: leadingTight,
  );

  static TextStyle titleMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: sizeLg,
    fontWeight: weightMedium,
    letterSpacing: trackingBtn,
    height: null,
  );

  static TextStyle bodyMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: sizeMd,
    fontWeight: weightRegular,
    letterSpacing: trackingBody,
    height: null,
  );
}
