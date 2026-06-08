import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF101113);
  static const Color surface = Color(0xFF181B20);
  static const Color surfaceElevated = Color(0xFF20242B);
  static const Color border = Color(0xFF343A42);
  static const Color primary = Color(0xFF6EE7F9);
  static const Color accent = Color(0xFFFF6B6B);
  static const Color success = Color(0xFFA3E635);
  static const Color warning = Color(0xFFFFC857);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFD6DBE3);
  static const Color textMuted = Color(0xFF9AA3AF);

  static const double maxContentWidth = 1200;
  static const double desktopHorizontalPadding = 96;
  static const double mobileHorizontalPadding = 24;
  static const double cardRadius = 8;

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.dark,
      ),
      textTheme: Typography.whiteMountainView.apply(
        bodyColor: textSecondary,
        displayColor: textPrimary,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: textPrimary,
          foregroundColor: background,
          disabledBackgroundColor: border,
          disabledForegroundColor: textMuted,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: textPrimary,
          side: const BorderSide(color: border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: textPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius),
          ),
        ),
      ),
    );
  }
}
