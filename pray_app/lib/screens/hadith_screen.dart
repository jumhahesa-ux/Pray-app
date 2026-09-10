import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/hadiths.dart';
import '../l10n/strings.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final today = hadithOfDay(DateTime.now());
    return Scaffold(
      appBar: AppBar(title: Text(L.t('daily_hadith'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.primaryGreen, AppColors.deepGreen]),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                Text(L.t('today_hadith'), style: const TextStyle(color: AppColors.lightGold, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(today.arabic, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 19, height: 1.7)),
                const SizedBox(height: 8),
                Text(today.translation, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 6),
                Text('- ${today.source}', style: const TextStyle(color: AppColors.lightGold, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(L.t('all_hadiths'), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          ...hadithList.map((h) => Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(h.arabic, style: const TextStyle(fontSize: 16, color: AppColors.primaryGreen, height: 1.6)),
                      const SizedBox(height: 6),
                      Text(h.translation, style: const TextStyle(height: 1.5)),
                      const SizedBox(height: 4),
                      Text('- ${h.source}', style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
