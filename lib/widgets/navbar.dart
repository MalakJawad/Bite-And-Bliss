import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'button.dart';
import 'toast.dart';

typedef NavLinkCallback = void Function(String id);

class Navbar extends StatefulWidget {
  final NavLinkCallback? onLinkTap;

  const Navbar({super.key, this.onLinkTap});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool isOpen = false;

  final navLinks = [
    {'label': 'Home', 'id': 'home'},
    {'label': 'Menu', 'id': 'menu'},
    {'label': 'Gallery', 'id': 'gallery'},
    {'label': 'About', 'id': 'about'},
    {'label': 'Contact', 'id': 'contact'},
  ];

  void toggleMenu() => setState(() => isOpen = !isOpen);

  void _handleNav(String id) {
    setState(() => isOpen = false);
    if (widget.onLinkTap != null) widget.onLinkTap!(id);
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.foreground.withValues(alpha: 0.98),
        border: const Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Logo
              GestureDetector(
                onTap: () => _handleNav('home'),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(text: 'Bite ', style: TextStyle(color: Color.fromARGB(255, 148, 163, 184))),
                      TextSpan(text: '&', style: TextStyle(color: AppColors.primary)),
                      TextSpan(text: ' Bliss', style: TextStyle(color: Color.fromARGB(255, 148, 163, 184))),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              if (isWide)
                Row(
                  children: navLinks
                      .map((link) => TextButton(
                            onPressed: () => _handleNav(link['id']!),
                            child: Text(link['label']!, style: const TextStyle(color: AppColors.muted)),
                          ))
                      .toList(),
                ),
              if (!isWide)
                IconButton(
                  icon: Icon(isOpen ? Icons.close : Icons.menu, color: AppColors.foreground),
                  onPressed: toggleMenu,
                ),
              const SizedBox(width: 12),
              Button(
                  label: 'Order Now',
                  onTap: () => showToast(context,
                      title: 'Online Ordering Coming Soon!',
                      description: 'Call us at +1 (555) 123-4567 to place your order now.')),
            ],
          ),
          if (!isWide && isOpen)
            Column(
              children: navLinks
                  .map(
                    (link) => ListTile(
                      title: Text(link['label']!, style: const TextStyle(color: AppColors.foreground)),
                      onTap: () => _handleNav(link['id']!),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
