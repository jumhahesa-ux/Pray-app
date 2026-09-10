import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/adhkar.dart';
import '../l10n/strings.dart';

class AdhkarScreen extends StatelessWidget {
  const AdhkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: adhkarCategories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(L.t('adhkar')),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: AppColors.gold,
            tabs: adhkarCategories.map((c) => Tab(text: '${c.icon} ${c.title}')).toList(),
          ),
        ),
        body: TabBarView(
          children: adhkarCategories.map((cat) {
            return ListView.separated(
              padding: const EdgeInsets.all(14),
              itemCount: cat.items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) => _DhikrCounterCard(item: cat.items[i]),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _DhikrCounterCard extends StatefulWidget {
  final DhikrItem item;
  const _DhikrCounterCard({required this.item});
  @override
  State<_DhikrCounterCard> createState() => _DhikrCounterCardState();
}

class _DhikrCounterCardState extends State<_DhikrCounterCard> {
  int _done = 0;

  @override
  Widget build(BuildContext context) {
    final complete = _done >= widget.item.count;
    return Card(
      color: complete ? AppColors.lightGold : AppColors.cardWhite,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => setState(() => _done = (_done + 1) % (widget.item.count + 1)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.item.arabic,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 19, color: AppColors.primaryGreen, height: 1.6)),
              const SizedBox(height: 8),
              Text(widget.item.meaning, style: const TextStyle(height: 1.5)),
              if (widget.item.count > 1) ...[
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Chip(
                    label: Text('$_done / ${widget.item.count}'),
                    backgroundColor: AppColors.primaryGreen.withValues(alpha: 0.1),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
