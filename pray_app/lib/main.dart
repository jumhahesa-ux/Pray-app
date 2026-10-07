import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';
import 'screens/home_screen.dart';
import 'l10n/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await L.load();
  await ThemeController.load();
  runApp(const PrayApp());
}

class PrayApp extends StatelessWidget {
  const PrayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppPalette>(
      valueListenable: ThemeController.notifier,
      builder: (context, palette, _) {
        return ValueListenableBuilder<AppLanguage>(
          valueListenable: L.notifier,
          builder: (context, lang, _) {
            return MaterialApp(
              key: ValueKey(palette.id),
              title: L.t('app_name'),
              debugShowCheckedModeBanner: false,
              theme: AppTheme.theme,
              builder: (context, child) => Directionality(
                textDirection: lang.isRtl ? TextDirection.rtl : TextDirection.ltr,
                child: child!,
              ),
              home: const HomeScreen(),
            );
          },
        );
      },
    );
  }
}
