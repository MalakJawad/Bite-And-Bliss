import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  final List<Map<String, dynamic>> testimonials = const [
    {'name': 'Sarah Johnson', 'role': 'Food Blogger', 'emoji': '👩‍🦰', 'rating': 5, 'text': 'Absolutely incredible! The burger was perfectly cooked.'},
    {'name': 'Michael Chen', 'role': 'Regular Customer', 'emoji': '👨‍💼', 'rating': 5, 'text': 'Great food, generous portions. Highly recommend!'},
    {'name': 'Emily Rodriguez', 'role': 'Local Foodie', 'emoji': '👩‍🍳', 'rating': 5, 'text': 'Every dish I\'ve tried has been amazing.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
      color: AppColors.background,
      child: Column(
        children: [
         const Text('Testimonials', style: TextStyle(color: AppColors.primary)),
          const SizedBox(height: 8),
          Text('What Our Guests Say', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Column(
            children: testimonials.map((t) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 6)]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: List.generate(t['rating'], (i) => const Icon(Icons.star, color: AppColors.gold, size: 18))),
                    const SizedBox(height: 8),
                    Text('"${t['text']}"', style: const TextStyle(color: AppColors.muted)),
                    const SizedBox(height: 12),
                    Row(children: [
                     CircleAvatar(
  backgroundColor: AppColors.secondary,
  child: Text(t['emoji']),
),

                      const SizedBox(width: 10),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(t['name'], style: const TextStyle(fontWeight: FontWeight.w700)),
                        Text(t['role'], style: const TextStyle(color: AppColors.muted, fontSize: 12)),
                      ]),
                    ]),
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
