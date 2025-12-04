import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../widgets/toast.dart';
import '../providers/cart_provider.dart';

class MenuDetailPage extends StatelessWidget {
  final String category;
  final List<Map<String, String?>> items;

  const MenuDetailPage({
    super.key,
    required this.category,
    required this.items,
  });

  double _parsePrice(String? priceStr) {
    if (priceStr == null || priceStr.isEmpty) return 0.0;
    return double.tryParse(priceStr.replaceAll('\$', '')) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.58,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            final price = _parsePrice(item['price']);

            return _MenuItemCard(
              item: item,
              imagePath: item['image'],
              onOrder: () {
                final id = (item['name'] ?? item['price'] ?? index.toString());

                cart.addToCart(
                  id: id,
                  name: item['name'] ?? '',
                  description: item['desc'] ?? '',
                  image: item['image'],
                  price: price,
                  quantity: 1,
                );

                showToast(context,
                    title: '${item['name']} added to your order');
              },
            );
          },
        ),
      ),
    );
  }
}

class _MenuItemCard extends StatefulWidget {
  final Map<String, String?> item;
  final String? imagePath;
  final VoidCallback onOrder;

  const _MenuItemCard({
    required this.item,
    required this.imagePath,
    required this.onOrder,
  });

  @override
  State<_MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<_MenuItemCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: _hovered
            ? Matrix4.diagonal3Values(1.03, 1.03, 1)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:0.06),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          children: [
        
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(14)),
                child: (widget.imagePath != null &&
                        widget.imagePath!.isNotEmpty)
                    ? Image.asset(
                        widget.imagePath!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (_, __, ___) => _fallbackImage(),
                      )
                    : _fallbackImage(),
              ),
            ),

           
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.item['name'] ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13, 
                      ),
                    ),

                    if (widget.item['desc'] != null &&
                        widget.item['desc']!.isNotEmpty)
                      Text(
                        widget.item['desc']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.muted,
                          fontSize: 10,
                        ),
                      ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.item['price'] ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13, 
                            color: AppColors.primary,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: widget.onOrder,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5), 
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.primaryForeground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Order',
                            style: TextStyle(fontSize: 11), 
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fallbackImage() {
    return Container(
      color: AppColors.secondary,
      child: const Center(
        child: Icon(
          Icons.image_not_supported,
          size: 35, 
          color: AppColors.muted,
        ),
      ),
    );
  }
}
