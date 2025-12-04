import 'package:flutter/material.dart';
import 'dart:ui'; 
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

  bool isNavbarSolid = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.offset > 80 && !isNavbarSolid) {
        setState(() => isNavbarSolid = true);
      } else if (scrollController.offset <= 80 && isNavbarSolid) {
        setState(() => isNavbarSolid = false);
      }
    });
  }

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
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                // HERO
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

                const SizedBox(height: 60),

                // MENU
                Container(
                  key: menuKey,
                  child: const MenuSection(),
                ),

                const SizedBox(height: 60),

                // GALLERY
                Container(
                  key: galleryKey,
                  child: const GallerySection(),
                ),

                const SizedBox(height: 60),

                // ABOUT
                Container(
                  key: aboutKey,
                  child: const AboutSection(),
                ),

                const SizedBox(height: 60),

                // CONTACT
                Container(
                  key: contactKey,
                  child: const ContactSection(),
                ),

                const SizedBox(height: 60),

                // FOOTER
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

          // stick nav bar:
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: isNavbarSolid ? 0 : 10,
                  sigmaY: isNavbarSolid ? 0 : 10,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 80,
                  decoration: BoxDecoration(
                    color: isNavbarSolid
                        ? Colors.black.withValues(alpha: 0.9)
                        : Colors.black.withValues(alpha: 0.3),
                  ),
                  child: Navbar(
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
