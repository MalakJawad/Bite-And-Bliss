import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  final features = const [
    {
      'title': 'Fresh Ingredients',
      'desc': 'Only the finest, locally sourced ingredients make it to your plate.',
      'emoji': '🥬'
    },
    {
      'title': 'Made with Love',
      'desc': 'Every dish is crafted with passion by our talented chefs.',
      'emoji': '❤️'
    },
    {
      'title': 'Quick Service',
      'desc': 'Enjoy prompt service without compromising on quality.',
      'emoji': '⏱️'
    },
    {
      'title': 'Award Winning',
      'desc': 'Recognized for excellence in taste and dining experience.',
      'emoji': '🏆'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
      color: AppColors.background,
      child: Column(
        children: [
          const Text('About Us', style: TextStyle(color: AppColors.primary)),
          const SizedBox(height: 8),
          Text('Every Bite is a Bliss',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text(
            'Bite & Bliss is more than just a restaurant — it’s an experience. '
            'We bring together the joy of delicious food and memorable moments.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.muted),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: features.map((f) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 6,
                        offset: const Offset(0, 4))
                  ],
                ),
                width: MediaQuery.of(context).size.width > 600
                    ? (MediaQuery.of(context).size.width - 72) / 2
                    : double.infinity,
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(f['emoji']!, style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(f['title']!,
                              style: const TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 4),
                          Text(f['desc']!,
                              style: const TextStyle(
                                  color: AppColors.muted, fontSize: 13)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
