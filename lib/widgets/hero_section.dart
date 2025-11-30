import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SizedBox(
      height: mq.height * 0.65,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/hero-burger.jpg', fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.foreground.withValues(alpha: 0.88),
                  AppColors.foreground.withValues(alpha: 0.64),
                  Colors.transparent
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 80,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome to',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                      children: const [
                        TextSpan(
                            text: 'Bite ',
                            style:
                                TextStyle(color: Color.fromARGB(235, 250, 250, 251))),
                        TextSpan(
                            text: '&',
                            style: TextStyle(color: AppColors.primary)),
                        TextSpan(
                            text: ' Bliss',
                            style: TextStyle(color: Color.fromARGB(255, 238, 239, 241))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Where flavor meets comfort. Experience mouth-watering dishes crafted with love, from freshly baked appetizers to decadent desserts.',
                    style: TextStyle(color: AppColors.primaryForeground, height: 1.4),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Button(
                          label: 'Explore Menu',
                          onTap: () => showDialog(
                              context: context,
                              builder: (_) => const SizedBox())),
                      const SizedBox(width: 12),
                      Button(
                          label: 'Book a Table',
                          onTap: () => showDialog(
                              context: context,
                              builder: (_) => const SizedBox()),
                          outline: true),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
