// lib/widgets/app_bar_with_cart.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../pages/cart_page.dart';
import '../theme/app_theme.dart';

class AppBarWithCart extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWithCart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return AppBar(
      title: Text(title),
      backgroundColor: AppColors.foreground.withValues(alpha:0.98),
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage()));
              },
            ),
            if (cart.totalItems > 0)
              Positioned(
                right: 6,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color.fromARGB(255, 250, 18, 18).withValues(alpha:0.1)),
                  ),
                  child: Text(
                    cart.totalItems > 99 ? '99+' : cart.totalItems.toString(),
                    style: const TextStyle(color: AppColors.primaryForeground, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 6),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
