import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/button.dart';

class HeroSection extends StatelessWidget {
  final Function(String id)? onNavigate;

  const HeroSection({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/hero-burger.jpg'), 
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withValues(alpha:0.4),
        padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bite & Bliss",
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryForeground,
                      shadows: [
                        Shadow(
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                          color: Colors.black.withValues(alpha:0.5),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                 const SizedBox(
                    width: 500,
                    child: Text(
                      "Discover the perfect blend of delightful bites and pure bliss crafted with passion and flavor.",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.primaryForeground,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Button(
                        label: "Explore Menu",
                        onTap: () => onNavigate?.call("menu"),
                      ),
                      const SizedBox(width: 14),
                      Button(
                        label: "Book a Table",
                        outline: true,
                        onTap: () => onNavigate?.call("contact"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
