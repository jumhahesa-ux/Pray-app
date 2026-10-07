import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPalette {
  final String id, name;
  final Color primary, deep, accent, lightAccent, background;
  const AppPalette(this.id, this.name, this.primary, this.deep,
      this.accent, this.lightAccent, this.background);
}

const appPalettes = [
  AppPalette('green', 'سەوزی ئیسلامی', Color(0xFF0F5132), Color(0xFF0A3822),
      Color(0xFFC9A24B), Color(0xFFF3E7C9), Color(0xFFFAF8F3)),
  AppPalette('blue', 'شین', Color(0xFF14507A), Color(0xFF0C3552),
      Color(0xFFC9A24B), Color(0xFFDCEBF5), Color(0xFFF5F9FC)),
  AppPalette('gold', 'زێڕین', Color(0xFF9A7420), Color(0xFF6E5214),
      Color(0xFFE3C878), Color(0xFFF8EFD2), Color(0xFFFCF9F0)),
  AppPalette('brown', 'قاوەیی', Color(0xFF6D4C41), Color(0xFF4E342E),
      Color(0xFFC9A24B), Color(0xFFF3E7C9), Color(0xFFFBF7F0)),
];

class ThemeController {
  static final notifier = ValueNotifier<AppPalette>(appPalettes.first);
  static AppPalette get palette => notifier.value;

  static Future<void> load() async {
    try {
      final p = await SharedPreferences.getInstance();
      final id = p.getString('palette_id');
      notifier.value =
          appPalettes.firstWhere((x) => x.id == id, orElse: () => appPalettes.first);
    } catch (_) {}
  }

  static Future<void> set(AppPalette x) async {
    notifier.value = x;
    try {
      final p = await SharedPreferences.getInstance();
      await p.setString('palette_id', x.id);
    } catch (_) {}
  }
}
