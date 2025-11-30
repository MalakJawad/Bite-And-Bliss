import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'toast.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  final List<Map<String, String>> items = const [
    {
      'name': 'Appetizers',
      'desc': 'Golden crispy starters to awaken your appetite.',
      'image': 'assets/appetizers.jpg',
      'category': 'Starters'
    },
    {
      'name': 'Pizza & Mains',
      'desc': 'Hand-tossed pizzas and hearty mains.',
      'image': 'assets/pizza.jpg',
      'category': 'Main Course'
    },
    {
      'name': 'Drinks',
      'desc': 'Refreshing cocktails & mocktails.',
      'image': 'assets/drinks.jpg',
      'category': 'Beverages'
    },
    {
      'name': 'Desserts',
      'desc': 'Indulgent sweet treats.',
      'image': 'assets/dessert.jpg',
      'category': 'Sweet Endings'
    },
  ];

  void _onCardTap(BuildContext context, String name) {
    showToast(context, title: '$name Selected', description: 'Full menu coming soon!');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 18),
      child: Column(
        children: [
          Text('Our Menu', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
         const Text('From savory starters to sweet finishes, discover dishes crafted with passion.',
              textAlign: TextAlign.center, style:  TextStyle(color: AppColors.muted)),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.85, crossAxisSpacing: 12, mainAxisSpacing: 12),
            itemBuilder: (context, i) {
              final it = items[i];
              return GestureDetector(
                onTap: () => _onCardTap(context, it['name']!),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: const Offset(0, 6))
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)), child: Image.asset(it['image']!, fit: BoxFit.cover, width: double.infinity))),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(12)), child: Text(it['category']!, style: const TextStyle(color: AppColors.primary, fontSize: 12))),
                            const SizedBox(height: 8),
                            Text(it['name']!, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                            const SizedBox(height: 6),
                            Text(it['desc']!, style: const TextStyle(color: AppColors.muted, fontSize: 13)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          GestureDetector(onTap: () => showToast(context, title: 'Full Menu Coming Soon!'), child: const Text('View Full Menu', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }
}
