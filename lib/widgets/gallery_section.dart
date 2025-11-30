import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GallerySection extends StatefulWidget {
  const GallerySection({super.key});

  @override
  State<GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  String? selectedImage;

  final gallery = const [
    'assets/gallery-interior.jpg',
    'assets/gallery-pasta.jpg',
    'assets/gallery-chef.jpg',
    'assets/gallery-salad.jpg',
    'assets/hero-burger.jpg',
    'assets/pizza.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
      child: Column(
        children: [
         const Text('Gallery', style: TextStyle(color: AppColors.primary)),
          const SizedBox(height: 8),
          Text('A Glimpse of Bliss', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: gallery.map((src) {
              return GestureDetector(
                onTap: () => setState(() => selectedImage = src),
                child: ClipRRect(borderRadius: BorderRadius.circular(14), child: Image.asset(src, fit: BoxFit.cover)),
              );
            }).toList(),
          ),
          if (selectedImage != null)
            GestureDetector(
              onTap: () => setState(() => selectedImage = null),
              child: Container(
                color: AppColors.foreground.withValues(alpha: 0.9),
                height: MediaQuery.of(context).size.height,
                child: Center(child: Image.asset(selectedImage!, fit: BoxFit.contain)),
              ),
            ),
        ],
      ),
    );
  }
}
