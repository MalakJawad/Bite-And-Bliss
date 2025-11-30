import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'toast.dart';
import 'button.dart';

class SpecialsSection extends StatelessWidget {
  const SpecialsSection({super.key});

  final List<Map<String, String>> specials = const [
    {
      'badge': 'Hot Deal',
      'title': 'Burger Combo',
      'desc': 'Signature burger + fries + drink',
      'original': '\$18.99',
      'price': '\$12.99'
    },
    {
      'badge': "Chef's Pick",
      'title': 'Family Feast',
      'desc': '2 pizzas + appetizer + 4 drinks',
      'original': '\$54.99',
      'price': '\$39.99'
    },
    {
      'badge': 'Happy Hour',
      'title': 'Drink Specials',
      'desc': 'All cocktails & mocktails 4-7pm',
      'original': '\$9.99',
      'price': '\$5.99'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Container(
      color: AppColors.foreground,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
      child: Column(
        children: [
          const Text('Limited Time', style: TextStyle(color: AppColors.primary)),
          const SizedBox(height: 6),
          Text(
            "Today's Specials",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: AppColors.primaryForeground, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: specials.map((s) {
              return GestureDetector(
                onTap: () => showToast(context,
                    title: '${s['title']} Added!', description: 'Online ordering coming soon.'),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  padding: const EdgeInsets.all(16),
                  width: isWide ? 360 : double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryForeground.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        color: AppColors.primaryForeground.withValues(alpha: 0.06)),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                decoration: BoxDecoration(
                                    color: AppColors.primary.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(s['badge']!,
                                    style: const TextStyle(color: AppColors.primary)),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.all(Radius.circular(8))),
                                child: Text(s['price']!,
                                    style: const TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(s['title']!,
                              style: const TextStyle(
                                  color: AppColors.primaryForeground,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          const SizedBox(height: 6),
                          Text(s['desc']!,
                              style: const TextStyle(
                                  color: AppColors.primaryForeground, fontSize: 13)),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(s['original']!,
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: AppColors.primaryForeground)),
                          const SizedBox(height: 6),
                          Button(
                              label: 'Order',
                              onTap: () =>
                                  showToast(context, title: 'Order placed (demo)')),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          Button(
              label: 'Order Special Now',
              onTap: () => showToast(context, title: 'Ordering not available yet')),
        ],
      ),
    );
  }
}
