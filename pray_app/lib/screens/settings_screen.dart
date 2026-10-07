import 'package:flutter/material.dart';
import '../theme/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppPalette>(
      valueListenable: ThemeController.notifier,
      builder: (context, current, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('ڕێکخستنەکان')),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('ڕەنگی ئەپەکە',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 14),
              Wrap(
                spacing: 14,
                runSpacing: 16,
                children: appPalettes.map((p) {
                  final selected = p.id == current.id;
                  return GestureDetector(
                    onTap: () => ThemeController.set(p),
                    child: SizedBox(
                      width: 76,
                      child: Column(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [p.primary, p.deep]),
                              border: Border.all(
                                color: selected ? p.accent : Colors.transparent,
                                width: 3,
                              ),
                            ),
                            child: selected
                                ? const Icon(Icons.check, color: Colors.white)
                                : null,
                          ),
                          const SizedBox(height: 6),
                          Text(p.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
