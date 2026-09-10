import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/asma_ul_husna.dart';
import '../l10n/strings.dart';

class AsmaScreen extends StatelessWidget {
  const AsmaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L.t('asma'))),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.3,
        ),
        itemCount: asmaUlHusna.length,
        itemBuilder: (context, i) {
          final n = asmaUlHusna[i];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.gold.withValues(alpha: 0.15),
                    child: Text('${i + 1}', style: const TextStyle(fontSize: 11, color: AppColors.gold)),
                  ),
                  const SizedBox(height: 8),
                  Text(n.arabic,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: AppColors.primaryGreen, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(n.meaning, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
