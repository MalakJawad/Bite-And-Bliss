import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static List<Map<String, String>> get features => [
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
    final isWide = MediaQuery.of(context).size.width > 600;
    final cardWidth = isWide ? (MediaQuery.of(context).size.width - 72) / 2 : double.infinity;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
      color: AppColors.background,
      child: Column(
        children: [
          const Text('About Us', style: TextStyle(color: AppColors.primary)),
          const SizedBox(height: 8),
          Text(
            'Every Bite is a Bliss',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
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
              return FeatureCard(
                title: f['title']!,
                desc: f['desc']!,
                emoji: f['emoji']!,
                width: cardWidth,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatefulWidget {
  final String title;
  final String desc;
  final String emoji;
  final double width;

  const FeatureCard({
    super.key,
    required this.title,
    required this.desc,
    required this.emoji,
    required this.width,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isHovered = true),
        onTapUp: (_) => setState(() => isHovered = false),
        onTapCancel: () => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(12),
          width: widget.width,
          decoration: BoxDecoration(
            color: isHovered
                ? AppColors.card.withValues(alpha: 0.95)
                : AppColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.08),
                blurRadius: isHovered ? 12 : 6,
                offset: Offset(0, isHovered ? 6 : 4),
              ),
            ],
          ),
transform: isHovered
    ? (Matrix4.identity()..scaleByVector3(Vector3(1.02, 1.02, 1)))
    : Matrix4.identity(),


          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha:0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(widget.emoji, style: const TextStyle(fontSize: 20)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    Text(widget.desc,
                        style: const TextStyle(color: AppColors.muted, fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
