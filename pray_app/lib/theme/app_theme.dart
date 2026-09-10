import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ڕەنگ و شێوازی گشتی ئەپەکە
/// ڕەنگی سەرەکی: سەوزی ئیسلامی + زێڕی
class AppColors {
  static const Color primaryGreen = Color(0xFF0F5132);
  static const Color deepGreen = Color(0xFF0A3822);
  static const Color gold = Color(0xFFC9A24B);
  static const Color lightGold = Color(0xFFF3E7C9);
  static const Color background = Color(0xFFFAF8F3);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1E2B22);
  static const Color textMuted = Color(0xFF6B7A70);
}

class AppTheme {
  static TextTheme _kurdishTextTheme(TextTheme base) {
    return GoogleFonts.notoKufiArabicTextTheme(base).copyWith(
      bodyLarge: GoogleFonts.notoNaskhArabic(fontSize: 16, color: AppColors.textDark),
      bodyMedium: GoogleFonts.notoNaskhArabic(fontSize: 14, color: AppColors.textDark),
    );
  }

  static ThemeData get theme {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primaryGreen,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primaryGreen,
        secondary: AppColors.gold,
        surface: AppColors.cardWhite,
      ),
      textTheme: _kurdishTextTheme(base.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.notoKufiArabic(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardWhite,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        margin: EdgeInsets.zero,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.cardWhite,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: AppColors.textMuted,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryGreen,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: GoogleFonts.notoKufiArabic(fontWeight: FontWeight.w600),
        ),
      ),
      useMaterial3: true,
    );
  }
}
