import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/quran_surahs.dart';
import '../l10n/strings.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L.t('quran'))),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: quranSurahs.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final s = quranSurahs[i];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primaryGreen.withValues(alpha: 0.1),
                child: Text('${s.number}', style: const TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold)),
              ),
              title: Text(s.arabicName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              subtitle: Text('${s.meaning} • ${s.ayahCount} ئایەت • ${s.isMeccan ? "مەککی" : "مەدەنی"}'),
              trailing: s.number == 1 ? const Icon(Icons.menu_book, color: AppColors.gold) : null,
              onTap: () {
                if (s.number == 1) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const _FatihaScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(L.t('quran_note'))),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class _FatihaScreen extends StatelessWidget {
  const _FatihaScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('سورەتی الفاتحة')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                alFatihaText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22, height: 2.2, color: AppColors.primaryGreen),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
