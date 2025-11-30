import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFFEF6E5E); 
  static const Color primaryForeground = Color(0xFFFFFFFF);
  static const Color foreground = Color(0xFF0F1724);
  static const Color background = Color(0xFFF8FAFC);
  static const Color secondary = Color(0xFFF1F5F9);
  static const Color card = Color(0xFFFFFFFF);
  static const Color muted = Color(0xFF94A3B8);
  static const Color border = Color(0xFFE6E9EE);
  static const Color gold = Color(0xFFFFD166);
}

class AppTheme {
  static ThemeData lightTheme() {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: base.colorScheme.copyWith(secondary: AppColors.secondary),
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).apply(
        bodyColor: AppColors.foreground,
        displayColor: AppColors.foreground,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.foreground),
        toolbarHeight: 72,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.primaryForeground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
