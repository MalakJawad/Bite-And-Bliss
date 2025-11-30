import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'toast.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  void _handleSocial(BuildContext context, String platform) {
    showToast(context, title: 'Follow us on $platform!', description: 'Social media links coming soon.');
  }

  void _scrollTo(BuildContext context, String id) {
    showToast(context, title: 'Scroll', description: 'Anchor navigation not implemented in demo.');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.foreground,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  RichText(text: const TextSpan(style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), children: [
                    TextSpan(text: 'Bite '),
                    TextSpan(text: '&', style: TextStyle(color: AppColors.primary)),
                    TextSpan(text: ' Bliss'),
                  ])),
                  const SizedBox(height: 8),
                  const Text('Where flavor meets comfort. Creating memorable dining experiences with every delicious bite since 2020.', style: TextStyle(color: AppColors.primaryForeground)),
                  const SizedBox(height: 12),
                  Row(children: [
                    IconButton(onPressed: () => _handleSocial(context, 'Instagram'), icon: const Icon(Icons.camera_alt, color: AppColors.primaryForeground)),
                    IconButton(onPressed: () => _handleSocial(context, 'Facebook'), icon: const Icon(Icons.facebook, color: AppColors.primaryForeground)),
                    IconButton(onPressed: () => _handleSocial(context, 'Twitter'), icon: const Icon(Icons.alternate_email, color: AppColors.primaryForeground)),
                  ]),
                ]),
              ),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Quick Links', style: TextStyle(color: AppColors.primaryForeground, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  TextButton(onPressed: () => _scrollTo(context, '#home'), child: const Text('Home', style: TextStyle(color: AppColors.primaryForeground))),
                  TextButton(onPressed: () => _scrollTo(context, '#menu'), child: const Text('Menu', style: TextStyle(color: AppColors.primaryForeground))),
                ]),
              ),
            const  Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                   Text('Opening Hours', style: TextStyle(color: AppColors.primaryForeground, fontWeight: FontWeight.bold)),
                   SizedBox(height: 6),
                   Text('Mon - Thu: 11am - 10pm', style: TextStyle(color: AppColors.primaryForeground)),
                   Text('Fri - Sat: 11am - 11pm', style: TextStyle(color: AppColors.primaryForeground)),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: AppColors.border),
          const SizedBox(height: 12),
          const Text('© 2024 Bite & Bliss. All rights reserved. Made with ❤️ for food lovers.', style: TextStyle(color: AppColors.primaryForeground, fontSize: 12)),
        ],
      ),
    );
  }
}
