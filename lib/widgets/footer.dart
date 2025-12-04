import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppFooter extends StatelessWidget {
  final Function(String id)? onLinkTap;

  const AppFooter({super.key, this.onLinkTap});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Container(
      color: AppColors.foreground,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.spaceBetween,
            children: [
              SizedBox(
                width: isWide ? 360 : double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style:  TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryForeground,
                        ),
                        children:  [
                          TextSpan(text: 'Bite '),
                          TextSpan(
                              text: '&',
                              style: TextStyle(color: AppColors.primary)),
                          TextSpan(text: ' Bliss'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Where flavor meets comfort. Creating memorable dining experiences with every delicious bite since 2020.',
                      style: TextStyle(color: AppColors.primaryForeground),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => onLinkTap?.call('instagram'),
                          icon: const Icon(Icons.camera_alt,
                              color: AppColors.primaryForeground),
                        ),
                        IconButton(
                          onPressed: () => onLinkTap?.call('facebook'),
                          icon: const Icon(Icons.facebook,
                              color: AppColors.primaryForeground),
                        ),
                        IconButton(
                          onPressed: () => onLinkTap?.call('twitter'),
                          icon: const Icon(Icons.alternate_email,
                              color: AppColors.primaryForeground),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: isWide ? 160 : double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Quick Links',
                        style: TextStyle(
                            color: AppColors.primaryForeground,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    TextButton(
                      onPressed: () => onLinkTap?.call('home'),
                      child: const Text('Home',
                          style: TextStyle(color: AppColors.primaryForeground)),
                    ),
                    TextButton(
                      onPressed: () => onLinkTap?.call('menu'),
                      child: const Text('Menu',
                          style: TextStyle(color: AppColors.primaryForeground)),
                    ),
                    TextButton(
                      onPressed: () => onLinkTap?.call('gallery'),
                      child: const Text('Gallery',
                          style: TextStyle(color: AppColors.primaryForeground)),
                    ),
                    TextButton(
                      onPressed: () => onLinkTap?.call('about'),
                      child: const Text('About',
                          style: TextStyle(color: AppColors.primaryForeground)),
                    ),
                    TextButton(
                      onPressed: () => onLinkTap?.call('contact'),
                      child: const Text('Contact',
                          style: TextStyle(color: AppColors.primaryForeground)),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: isWide ? 160 : double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Opening Hours',
                        style: TextStyle(
                            color: AppColors.primaryForeground,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text('Mon - Thu: 11am - 10pm',
                        style: TextStyle(color: AppColors.primaryForeground)),
                    Text('Fri - Sat: 11am - 12am',
                        style: TextStyle(color: AppColors.primaryForeground)),
                    Text('Sun: 11am - 1am',
                        style: TextStyle(color: AppColors.primaryForeground)),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(color: AppColors.border),
          const SizedBox(height: 12),
          const Text(
            '© 2024 Bite & Bliss. All rights reserved. Made with ❤️ for food lovers.',
            style: TextStyle(color: AppColors.primaryForeground, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
