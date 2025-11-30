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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             Navbar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children:  [
                    HeroSection(),
                    SizedBox(height: 32),
                    MenuSection(),
                    SizedBox(height: 24),
                    SpecialsSection(),
                    SizedBox(height: 24),
                    GallerySection(),
                    SizedBox(height: 24),
                    AboutSection(),
                    SizedBox(height: 24),
                    TestimonialsSection(),
                    SizedBox(height: 24),
                    ContactSection(),
                    SizedBox(height: 24),
                    NewsletterSection(),
                    SizedBox(height: 24),
                    Footer(),
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
