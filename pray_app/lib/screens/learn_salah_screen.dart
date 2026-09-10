import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/salah_steps.dart';
import '../l10n/strings.dart';

class LearnSalahScreen extends StatelessWidget {
  const LearnSalahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L.t('learn_salah'))),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: AppColors.lightGold,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              L.t('shafii_note'),
              style: const TextStyle(height: 1.5),
            ),
          ),
          ...salahSections.map((section) => _SectionTile(section: section)),
        ],
      ),
    );
  }
}

class _SectionTile extends StatelessWidget {
  final SalahSection section;
  const _SectionTile({required this.section});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Text(section.icon, style: const TextStyle(fontSize: 26)),
          title: Text(section.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: section.steps.map((step) => _StepCard(step: step)).toList(),
        ),
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final SalahStep step;
  const _StepCard({required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(step.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          if (step.arabic.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(step.arabic,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: AppColors.primaryGreen)),
          ],
          const SizedBox(height: 8),
          Text(step.description, style: const TextStyle(height: 1.6)),
          if (step.note != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.gold.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, size: 18, color: AppColors.gold),
                  const SizedBox(width: 6),
                  Expanded(child: Text(step.note!, style: const TextStyle(fontSize: 12.5, height: 1.5))),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
