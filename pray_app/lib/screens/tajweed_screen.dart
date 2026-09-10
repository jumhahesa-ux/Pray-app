import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/tajweed_letters.dart';
import '../l10n/strings.dart';

class TajweedScreen extends StatelessWidget {
  const TajweedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(L.t('tajweed')),
          bottom: TabBar(
            indicatorColor: AppColors.gold,
            tabs: [Tab(text: L.t('makharij_tab')), Tab(text: L.t('tajweed_rules_tab'))],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.separated(
              padding: const EdgeInsets.all(14),
              itemCount: makhrajGroups.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final g = makhrajGroups[i];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(g.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(height: 6),
                        Text(g.letters,
                            style: const TextStyle(fontSize: 24, color: AppColors.primaryGreen)),
                        const SizedBox(height: 6),
                        Text(g.description, style: const TextStyle(height: 1.6)),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListView.separated(
              padding: const EdgeInsets.all(14),
              itemCount: tajweedRules.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final r = tajweedRules[i];
                return Card(
                  child: ListTile(
                    title: Text(r.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(r.description, style: const TextStyle(height: 1.6)),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
