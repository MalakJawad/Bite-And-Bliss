import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MenuDetailPage extends StatelessWidget {
  final String category;
  final List<Map<String, String?>> items;

  const MenuDetailPage({super.key, required this.category, required this.items});

  @override
  Widget build(BuildContext context) {
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
            childAspectRatio: 1.2, // taller for full image effect
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Full background image if exists
                  if (item['image'] != null)
                    Image.asset(
                      item['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  else
                    Container(color: AppColors.card), // fallback color

                  // Dark overlay for text readability
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha:0.3),
                    ),
                  ),

                  // Text content at bottom
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
