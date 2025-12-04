import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppFooter extends StatefulWidget {
  final Function(String id)? onLinkTap;

  const AppFooter({super.key, this.onLinkTap});

  @override
  State<AppFooter> createState() => _AppFooterState();
}

class _AppFooterState extends State<AppFooter> {
  // Track hover state for icons
  bool _hoverInstagram = false;
  bool _hoverFacebook = false;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Container(
      width: double.infinity,
      color: AppColors.foreground,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: isWide ? WrapAlignment.spaceBetween : WrapAlignment.center,
            children: [
              // Logo & Description
              SizedBox(
                width: isWide ? 360 : double.infinity,
                child: Column(
                  crossAxisAlignment: isWide
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: isWide ? TextAlign.left : TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryForeground,
                        ),
                        children: [
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
                      textAlign: TextAlign.left,
                      style: TextStyle(color: AppColors.primaryForeground),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment:
                          isWide ? MainAxisAlignment.start : MainAxisAlignment.center,
                      children: [
                        // Instagram icon
                        MouseRegion(
                          onEnter: (_) => setState(() => _hoverInstagram = true),
                          onExit: (_) => setState(() => _hoverInstagram = false),
                          child: GestureDetector(
                            onTap: () => widget.onLinkTap?.call('instagram'),
                            child: AnimatedScale(
                              scale: _hoverInstagram ? 1.2 : 1.0,
                              duration: const Duration(milliseconds: 150),
                              child: const Icon(
                                Icons.camera_alt,
                                color: AppColors.primaryForeground,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Facebook icon
                        MouseRegion(
                          onEnter: (_) => setState(() => _hoverFacebook = true),
                          onExit: (_) => setState(() => _hoverFacebook = false),
                          child: GestureDetector(
                            onTap: () => widget.onLinkTap?.call('facebook'),
                            child: AnimatedScale(
                              scale: _hoverFacebook ? 1.2 : 1.0,
                              duration: const Duration(milliseconds: 150),
                              child: const Icon(
                                Icons.facebook,
                                color: AppColors.primaryForeground,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Quick Links
              SizedBox(
                width: isWide ? 160 : double.infinity,
                child: Column(
                  crossAxisAlignment: isWide
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    const Text('Quick Links',
                        style: TextStyle(
                            color: AppColors.primaryForeground,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    TextButton(
                      onPressed: () => widget.onLinkTap?.call('home'),
                      child: const Text('Home',
                          style:
                              TextStyle(color: AppColors.primaryForeground)),
                    ),
                    TextButton(
                      onPressed: () => widget.onLinkTap?.call('menu'),
                      child: const Text('Menu',
                          style:
                              TextStyle(color: AppColors.primaryForeground)),
                    ),
                    TextButton(
                      onPressed: () => widget.onLinkTap?.call('gallery'),
                      child: const Text('Gallery',
                          style:
                              TextStyle(color: AppColors.primaryForeground)),
                    ),
                    TextButton(
                      onPressed: () => widget.onLinkTap?.call('about'),
                      child: const Text('About',
                          style:
                              TextStyle(color: AppColors.primaryForeground)),
                    ),
                    TextButton(
                      onPressed: () => widget.onLinkTap?.call('contact'),
                      child: const Text('Contact',
                          style:
                              TextStyle(color: AppColors.primaryForeground)),
                    ),
                  ],
                ),
              ),

              // Opening Hours
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
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.primaryForeground, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
