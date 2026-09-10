import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/hadiths.dart';
import '../l10n/strings.dart';
import 'learn_salah_screen.dart';
import 'prayer_times_screen.dart';
import 'qibla_screen.dart';
import 'quran_screen.dart';
import 'tafsir_screen.dart';
import 'tajweed_screen.dart';
import 'hadith_screen.dart';
import 'adhkar_screen.dart';
import 'asma_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showLanguagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cardWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(L.t('select_language'),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 12),
                ...AppLanguage.values.map((lang) => ListTile(
                      title: Text(lang.nativeName, textAlign: TextAlign.center),
                      trailing: L.current == lang ? const Icon(Icons.check, color: AppColors.primaryGreen) : null,
                      onTap: () {
                        L.set(lang);
                        Navigator.pop(context);
                      },
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final today = hadithOfDay(DateTime.now());

    final items = <_HomeItem>[
      _HomeItem(L.t('learn_salah'), '🕌', AppColors.primaryGreen, const LearnSalahScreen()),
      _HomeItem(L.t('prayer_times'), '🕐', AppColors.deepGreen, const PrayerTimesScreen()),
      _HomeItem(L.t('qibla'), '🧭', AppColors.gold, const QiblaScreen()),
      _HomeItem(L.t('quran'), '📖', AppColors.primaryGreen, const QuranScreen()),
      _HomeItem(L.t('tafsir'), '📝', AppColors.deepGreen, const TafsirScreen()),
      _HomeItem(L.t('tajweed'), '🔤', AppColors.gold, const TajweedScreen()),
      _HomeItem(L.t('daily_hadith'), '💬', AppColors.primaryGreen, const HadithScreen()),
      _HomeItem(L.t('adhkar'), '📿', AppColors.deepGreen, const AdhkarScreen()),
      _HomeItem(L.t('asma'), '✨', AppColors.gold, const AsmaScreen()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(L.t('app_name')),
        actions: [
          IconButton(
            onPressed: () => _showLanguagePicker(context),
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primaryGreen, AppColors.deepGreen],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(L.t('today_hadith'),
                    style: TextStyle(color: AppColors.lightGold, fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Text(today.arabic,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 18, height: 1.6)),
                const SizedBox(height: 8),
                Text(today.translation, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 6),
                Text('- ${today.source}', style: TextStyle(color: AppColors.lightGold, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.15,
            children: items.map((item) => _buildCard(context, item)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, _HomeItem item) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => item.screen)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: item.color.withValues(alpha: 0.12),
                child: Text(item.icon, style: const TextStyle(fontSize: 24)),
              ),
              const SizedBox(height: 10),
              Text(item.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeItem {
  final String title;
  final String icon;
  final Color color;
  final Widget screen;
  _HomeItem(this.title, this.icon, this.color, this.screen);
}
