import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'button.dart';
import 'toast.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

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

  void handleOrderNow() {
    showToast(context, title: 'Online Ordering Coming Soon!', description: 'Call us at +1 (555) 123-4567 to place your order now.');
  }

  void toggleMenu() => setState(() => isOpen = !isOpen);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.98),
        border: const Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Logo
              GestureDetector(
                onTap: () => Scrollable.ensureVisible(
                  context,
                  duration: const Duration(milliseconds: 300),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(text: 'Bite ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.foreground)),
                      TextSpan(text: '&', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primary)),
                      TextSpan(text: ' Bliss', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.foreground)),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              // Desktop links (hidden on small widths; but simple)
              Row(
                children: navLinks.map((link) {
                  return TextButton(
                    onPressed: () {
                      showToast(context, title: 'Navigate', description: 'Jump to ${link['label']} (anchor scrolling not implemented)');
                    },
                    child: Text(link['label']!, style: const TextStyle(color: AppColors.muted)),
                  );
                }).toList(),
              ),
              const SizedBox(width: 8),
              Button(label: 'Order Now', onTap: handleOrderNow),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(isOpen ? Icons.close : Icons.menu, color: AppColors.foreground),
                onPressed: toggleMenu,
              ),
            ],
          ),
          if (isOpen)
            Column(
              children: navLinks.map((link) {
                return ListTile(
                  title: Text(link['label']!, style: const TextStyle(color: AppColors.foreground)),
                  onTap: () {
                    setState(() => isOpen = false);
                    showToast(context, title: 'Navigate', description: 'Jump to ${link['label']} (anchor scrolling not implemented)');
                  },
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
