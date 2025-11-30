import 'package:flutter/material.dart';

import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/menu_section.dart';
import '../widgets/specials_section.dart';
import '../widgets/gallery_section.dart';
import '../widgets/about_section.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/newsletter_section.dart';
import '../widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();

  // Section keys
  final homeKey = GlobalKey();
  final menuKey = GlobalKey();
  final galleryKey = GlobalKey();
  final aboutKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Navbar(
              onLinkTap: (id) {
                switch (id) {
                  case 'home':
                    scrollToSection(homeKey);
                    break;
                  case 'menu':
                    scrollToSection(menuKey);
                    break;
                  case 'gallery':
                    scrollToSection(galleryKey);
                    break;
                  case 'about':
                    scrollToSection(aboutKey);
                    break;
                  case 'contact':
                    scrollToSection(contactKey);
                    break;
                }
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    // Hero Section
                    Container(key: homeKey, child: const HeroSection()),
                    const SizedBox(height: 40),

                    // Menu Section
                    Container(key: menuKey, child: const MenuSection()),
                    const SizedBox(height: 32),

                    // Specials Section
                    const SpecialsSection(),
                    const SizedBox(height: 32),

                    // Gallery Section
                    Container(key: galleryKey, child: const GallerySection()),
                    const SizedBox(height: 32),

                    // About Section
                    Container(key: aboutKey, child: const AboutSection()),
                    const SizedBox(height: 32),

                    // Testimonials Section
                    const TestimonialsSection(),
                    const SizedBox(height: 32),

                    // Contact Section
                    Container(key: contactKey, child: const ContactSection()),
                    const SizedBox(height: 32),

                    // Newsletter Section
                    const NewsletterSection(),
                    const SizedBox(height: 32),

                    // Footer
                    const Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
