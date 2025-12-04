import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../providers/cart_provider.dart';

class MenuDetailPage extends StatelessWidget {
  final String category;
  final List<Map<String, String?>> items;

  const MenuDetailPage({super.key, required this.category, required this.items});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  if (item['image'] != null)
                    Image.asset(
                      item['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  else
                    Container(color: AppColors.card),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha:0.3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryForeground,
                          ),
                        ),
                        if (item['desc'] != null && item['desc']!.isNotEmpty)
                          Text(
                            item['desc']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.primaryForeground,
                            ),
                          ),
                        const SizedBox(height: 4),
                        Text(
                          item['price'] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        ElevatedButton(
                          onPressed: () {
                            final priceValue = double.tryParse(
                                item['price']?.replaceAll('\$', '') ?? '0') ?? 0;

                            cartProvider.addToCart(
                              id: item['name']!, 
                              name: item['name']!,
                              description: item['desc'] ?? '',
                              image: item['image'],
                              price: priceValue,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${item['name']} added to cart'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                          ),
                          child: const Text('Order'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}