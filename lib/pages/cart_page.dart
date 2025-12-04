import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../providers/cart_provider.dart';
import 'checkout_page.dart'; // Make sure this page exists

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: AppColors.primary,
      ),
      body: cart.items.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.shopping_bag_outlined, size: 72, color: Color.fromARGB(255, 212, 20, 20)),
                  const SizedBox(height: 12),
                  const Text('Your cart is empty', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Browse menu'),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: cart.items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, idx) {
                        final item = cart.items[idx];
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.border),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Container(
                                width: 72,
                                height: 72,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.secondary,
                                  image: item.image != null
                                      ? DecorationImage(image: AssetImage(item.image!), fit: BoxFit.cover)
                                      : null,
                                ),
                                child: item.image == null ? const Icon(Icons.fastfood, color: AppColors.muted) : null,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                                    const SizedBox(height: 6),
                                    Text(item.description, style: const TextStyle(color: AppColors.muted)),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () => cart.updateQuantity(item.id, item.quantity - 1),
                                              icon: const Icon(Icons.remove_circle_outline),
                                            ),
                                            SizedBox(
                                              width: 36,
                                              child: Center(child: Text(item.quantity.toString(), style: const TextStyle(fontWeight: FontWeight.bold))),
                                            ),
                                            IconButton(
                                              onPressed: () => cart.updateQuantity(item.id, item.quantity + 1),
                                              icon: const Icon(Icons.add_circle_outline),
                                            ),
                                          ],
                                        ),
                                        Text('\$${item.total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () => cart.removeFromCart(item.id),
                                icon: const Icon(Icons.delete_outline, color: Colors.red),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal (${cart.totalItems} items)', style: const TextStyle(color: AppColors.muted)),
                            Text('\$${cart.subtotal.toStringAsFixed(2)}')
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Delivery Fee', style: TextStyle(color: AppColors.muted)),
                            Text(
                              cart.deliveryFee == 0 ? 'Free' : '\$${cart.deliveryFee.toStringAsFixed(2)}',
                              style: TextStyle(color: cart.deliveryFee == 0 ? AppColors.primary : AppColors.foreground, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tax (10%)', style: TextStyle(color: AppColors.muted)),
                            Text('\$${cart.tax.toStringAsFixed(2)}')
                          ],
                        ),
                        const Divider(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text('\$${cart.total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary))
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                                onPressed: () {
                                  if (cart.items.isNotEmpty) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const CheckoutPage()),
                                    );
                                  }
                                },
                                child: const Text('Proceed to Checkout'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text('Free delivery on orders over \$25', style: TextStyle(fontSize: 12, color: AppColors.muted)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
