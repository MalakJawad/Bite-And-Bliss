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
import '../widgets/animated_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Navbar(),
            HeroSection(),
            AnimatedSection(child: MenuSection()),
            AnimatedSection(child: SpecialsSection(), delay: 0.1),
            AnimatedSection(child: GallerySection(), delay: 0.1),
            AnimatedSection(child: AboutSection(), delay: 0.1),
            AnimatedSection(child: TestimonialsSection(), delay: 0.1),
            AnimatedSection(child: ContactSection(), delay: 0.1),
            AnimatedSection(child: NewsletterSection(), delay: 0.1),
            Footer(),
          ],
        ),
      ),
    );
  }
}
