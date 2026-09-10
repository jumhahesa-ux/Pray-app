import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/quran_surahs.dart';
import '../l10n/strings.dart';

class TafsirScreen extends StatelessWidget {
  const TafsirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L.t('tafsir'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('سورەتی الفاتحة',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.primaryGreen)),
                  const SizedBox(height: 10),
                  Text(alFatihaTafsirBrief, style: const TextStyle(height: 1.7)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.lightGold, borderRadius: BorderRadius.circular(14)),
            child: const Text(
              'بەشی تەفسیر لە داهاتوودا بۆ هەموو سورەتەکان فراوان دەکرێت. دەتوانیت لێرەدا لینکی کتێبی تەفسیر (وەک تەفسیری ئیبن کەسیر یان موختەسەری قورتوبی) زیاد بکەیت.',
              style: TextStyle(height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}
