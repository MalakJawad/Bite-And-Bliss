import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/menu_section.dart';
import '../widgets/gallery_section.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();

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
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Navbar(
              onLinkTap: (id) {
                switch (id) {
                  case "home":
                    scrollToSection(homeKey);
                    break;
                  case "menu":
                    scrollToSection(menuKey);
                    break;
                  case "gallery":
                    scrollToSection(galleryKey);
                    break;
                  case "about":
                    scrollToSection(aboutKey);
                    break;
                  case "contact":
                    scrollToSection(contactKey);
                    break;
                }
              },
            ),

            Container(
              key: homeKey,
              child: HeroSection(
                onNavigate: (id) {
                  switch (id) {
                    case "menu":
                      scrollToSection(menuKey);
                      break;
                    case "contact":
                      scrollToSection(contactKey);
                      break;
                  }
                },
              ),
            ),

            Container(
              key: menuKey,
              child: const MenuSection(),
            ),

            Container(
              key: galleryKey,
              child: const GallerySection(),
            ),

            Container(
              key: aboutKey,
              child: const AboutSection(),
            ),

            Container(
              key: contactKey,
              child: const ContactSection(),
            ),

            AppFooter(
              onLinkTap: (id) {
                switch (id) {
                  case "home":
                    scrollToSection(homeKey);
                    break;
                  case "menu":
                    scrollToSection(menuKey);
                    break;
                  case "gallery":
                    scrollToSection(galleryKey);
                    break;
                  case "about":
                    scrollToSection(aboutKey);
                    break;
                  case "contact":
                    scrollToSection(contactKey);
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
