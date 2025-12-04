import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'menu_detail_page.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  final List<Map<String, String>> categories = const [
    {
      'name': 'Appetizers',
      'desc': 'Golden crispy starters to awaken your appetite.',
      'image': 'assets/appetizers.jpg',
    },
    {
      'name': 'Pizza & Mains',
      'desc': 'Hand-tossed pizzas and hearty mains.',
      'image': 'assets/pizza.jpg',
    },
    {
      'name': 'Drinks',
      'desc': 'Refreshing drinks & cocktails.',
      'image': 'assets/drinks.jpg',
    },
    {
      'name': 'Desserts',
      'desc': 'Indulgent sweet treats.',
      'image': 'assets/dessert.jpg',
    },
  ];

  void _onCategoryTap(BuildContext context, String name) {
    final items = _getItems(name);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MenuDetailPage(category: name, items: items),
      ),
    );
  }

  List<Map<String, String?>> _getItems(String name) {
    switch (name) {
      case 'Appetizers':
        return [
          {'name': 'French Golden Fries', 'desc': 'Served with ketchup', 'image': 'assets/fries.jpg', 'price': '\$5'},
          {'name': 'Wedges', 'desc': 'Served with cocktail sauce', 'image': 'assets/wedges.jpg', 'price': '\$3.5'},
          {'name': 'Nuggets', 'desc': '6 pieces, served with cocktail sauce', 'image': 'assets/nuggets.jpeg', 'price': '\$4'},
          {'name': 'Mozzarella Sticks (4 pieces)', 'desc': 'Served with BBQ sauce', 'image': 'assets/sticks.jpg', 'price': '\$5'},
          {'name': 'Wings (3 pieces)', 'desc': 'Served with BBQ sauce', 'image': 'assets/wings.jpg', 'price': '\$2.5'},
        ];
      case 'Pizza & Mains':
        return [
          {'name': 'Margherita Pizza', 'image': 'assets/plain.jpg', 'price': '\$10'},
          {'name': 'Chicken Alfredo Pizza', 'image': 'assets/alfredo.jpg', 'price': '\$14'},
          {'name': 'Pepperoni Pizza', 'image': 'assets/pep.jpg', 'price': '\$12'},
          {'name': 'Chicken Ranch Pizza', 'desc': '', 'image': 'assets/ranch.jpg', 'price': '\$12'},
          {'name': 'Smocked BBQ Chicken Pizza', 'desc': '', 'image': 'assets/bbq.png', 'price': '\$13'},
          {'name': 'Vegetarian Pizza', 'desc': '', 'image': 'assets/vegi.jpg', 'price': '\$11'},
          {'name': 'Lebanese Turkey Pizza', 'desc': '', 'image': 'assets/turkey.png', 'price': '\$12'},
          {'name': 'Smocked Brisket Pizza', 'desc': '', 'image': 'assets/briskit.jpg', 'price': '\$14'},
          {'name': 'Truffle Pizza', 'desc': '', 'image': 'assets/truffle.png', 'price': '\$13'},
          {'name': 'Chicken Alfredo Pasta', 'desc': '', 'image': 'assets/alfredopasta.jpg', 'price': '\$14'},
          {'name': 'Spaghetti Pomodoro', 'desc': '', 'image': 'assets/pomodoro.jpg', 'price': '\$8'},
          {'name': 'Swiss Mushroom Pasta', 'desc': '', 'image': 'assets/swiss.png', 'price': '\$12'},
          {'name': 'Lebanese Burger', 'desc': '', 'image': 'assets/leb.jpg', 'price': '\$5'},
          {'name': 'Buffalo Burger', 'desc': '', 'image': 'assets/buffalo.jpg', 'price': '\$6'},
          {'name': 'Smashed Burger', 'desc': '', 'image': 'assets/smashedburger.jpg', 'price': '\$7'},
        ];
      case 'Drinks':
        return [
          {'name': 'Pepsi', 'desc': '1.25', 'image': null, 'price': '\$2'},
          {'name': 'Miranda', 'desc': '1.25', 'image': null, 'price': '\$2'},
          {'name': '7 Up', 'desc': '1.25', 'image': null, 'price': '\$2'},
          {'name': 'Diet', 'desc': '1.25', 'image': null, 'price': '\$2'},
          {'name': 'Water Small', 'desc': '', 'image': null, 'price': '\$0.5'},
          {'name': 'Water Large', 'desc': '', 'image': null, 'price': '\$1'},
          {'name': 'Ice Tea Peach', 'desc': '', 'image': null, 'price': '\$1.5'},
          {'name': 'Ice Tea Lemon', 'desc': '', 'image': null, 'price': '\$1.5'},
          {'name': 'Ice Tea Zero', 'desc': '', 'image': null, 'price': '\$1.5'},
          {'name': 'Orange Fresh Juice', 'desc': '', 'image': 'assets/orange.jpg', 'price': '\$4'},
          {'name': 'Mango Fresh Juice', 'desc': '', 'image': 'assets/mango.jpg', 'price': '\$5'},
          {'name': 'Pineapple Fresh Juice', 'desc': '', 'image': 'assets/pineapple.jpg', 'price': '\$5.5'},
          {'name': 'Lemonade Fresh Juice', 'desc': '', 'image': 'assets/lemonade.jpg', 'price': '\$3.5'},
          {'name': 'Minted Lemonade Fresh Juice', 'desc': '', 'image': 'assets/minted.jpg', 'price': '\$4'},
          {'name': 'Cocktail Juice', 'desc': '', 'image': 'assets/cocktail.png', 'price': '\$8'},
        ];
      case 'Desserts':
        return [
          {'name': 'Chocolate Cake', 'image': 'assets/choco.jpg', 'price': '\$5'},
          {'name': 'Tiramisu', 'image': 'assets/tiramisu.png', 'price': '\$6'},
          {'name': 'Caramel Cake', 'desc': '', 'image': 'assets/caramel.png', 'price': '\$6'},
          {'name': 'Cheese Cake', 'desc': '', 'image': 'assets/cheesecake.jpg', 'price': '\$5.5'},
          {'name': 'Brownie Pudding', 'desc': '', 'image': 'assets/pudding.jpg', 'price': '\$6.5'},
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Our Menu',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Select a section to view its menu items.',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.muted),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5, // slightly taller for full image coverage
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, i) {
            final cat = categories[i];
            return GestureDetector(
              onTap: () => _onCategoryTap(context, cat['name']!),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Stack(
                  children: [
                    // Full background image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        cat['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    // Dark overlay for readability
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black.withValues(alpha:0.3),
                      ),
                    ),
                    // Text content
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cat['name']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.primaryForeground,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cat['desc']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.primaryForeground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
