import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import 'button.dart';
import '../providers/cart_provider.dart';
import '../pages/cart_page.dart';

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
    final cart = context.watch<CartProvider>();

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
              // Logo:
              GestureDetector(
                onTap: () => _handleNav('home'),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(text: 'Bite ', style: TextStyle(color: Color.fromARGB(255, 148, 163, 184))),
                      TextSpan(text: '&', style: TextStyle(color: Color.fromARGB(255, 239,110,94))), 
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
                            child: Text(link['label']!, style: const TextStyle(color: Color.fromARGB(255, 217, 222, 230))),
                          ))
                      .toList(),
                ),
              if (!isWide)
                IconButton(
                  icon: Icon(isOpen ? Icons.close : Icons.menu, color: const Color.fromARGB(255, 239,110,94)),
                  onPressed: toggleMenu,
                ),
              const SizedBox(width: 12),

              // Cart icon:
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Color.fromARGB(255, 239,110,94), 
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CartPage()),
                      );
                    },
                  ),
                  if (cart.totalItems > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 148, 163, 184), 
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          cart.totalItems > 99 ? '99+' : cart.totalItems.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

             Button(
  label: 'Order Now',
  onTap: () => _handleNav('menu'),
),

            ],
          ),
          if (!isWide && isOpen)
            Column(
              children: navLinks
                  .map(
                    (link) => ListTile(
                      title: Text(link['label']!, style: const TextStyle(color: Color.fromARGB(255, 239,110,94))),
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
