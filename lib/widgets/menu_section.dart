import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'toast.dart';
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
      'desc': 'Refreshing cocktails & mocktails.',
      'image': 'assets/drinks.jpg',
    },
    {
      'name': 'Desserts',
      'desc': 'Indulgent sweet treats.',
      'image': 'assets/dessert.jpg',
    },
  ];

  void _onCategoryTap(BuildContext context, String name) {
    List<Map<String, String>> items = [];

    switch (name) {
      case 'Appetizers':
        items = [
          {'name': 'French Golden Fries (500g)', 'desc': 'Served with ketchup', 'image': 'assets/fries.jpg', 'price': '\$5'},
          {'name': 'Wedges (250g)', 'desc': 'Served with cocktail sauce', 'image': 'assets/wedges.jpg', 'price': '\$3.5'},
          {'name': 'Nuggets (6 pieces)', 'desc': 'Served with cocktail sauce', 'image': 'assets/nuggets.jpg', 'price': '\$4'},
          {'name': 'Mozzarella Sticks (4 pieces)', 'desc': 'Served with BBQ sauce', 'image': 'assets/sticks.jpg', 'price': '\$5'},
          {'name': 'Wings (3 pieces)', 'desc': 'Served with BBQ sauce', 'image': 'assets/wings.jpg', 'price': '\$2.5'},
        ];
        break;

      case 'Pizza & Mains':
        items = [
          {'name': 'Margarita Pizza', 'desc': '', 'image': 'assets/pizza.jpg', 'price': '\$10'},
          {'name': 'Chicken Alfredo Pizza', 'desc': '', 'image': 'assets/pizza.jpg', 'price': '\$14'},
          {'name': 'Peperoni Pizza', 'desc': '', 'image': 'assets/pizza.jpg', 'price': '\$12'},
          {'name': 'Chicken Ranch Pizza', 'desc': '', 'image': 'assets/pizza.jpg', 'price': '\$12'},
          {'name': 'Smocked BBQ Chicken Pizza', 'desc': '', 'image': 'assets/pizza.jpg', 'price': '\$13'},
          {'name': 'Vegetarian Pizza', 'desc': '', 'image': 'assets/pizza.jpg', 'price': '\$11'},
          {'name': 'Lebanese Pizza', 'desc': '', 'image': 'assets/pizza.jpg', 'price': '\$12'},
          {'name': 'Smocked Brisket Pizza', 'desc': '', 'image': 'assets/pizza.jpg', 'price': '\$14'},
          {'name': 'Truffle Pizza', 'desc': '', 'image': 'assets/pizza.jpg', 'price': '\$13'},
          {'name': 'Chicken Alfredo Pasta', 'desc': '', 'image': 'assets/pasta.jpg', 'price': '\$14'},
          {'name': 'Spaghetti Pomodoro', 'desc': '', 'image': 'assets/pasta.jpg', 'price': '\$8'},
          {'name': 'Swiss Mushroom Pasta', 'desc': '', 'image': 'assets/pasta.jpg', 'price': '\$12'},
          {'name': 'Lebanese Burger', 'desc': '', 'image': 'assets/burger.jpg', 'price': '\$5'},
          {'name': 'Buffalo Burger', 'desc': '', 'image': 'assets/burger.jpg', 'price': '\$6'},
          {'name': 'Smashed Burger', 'desc': '', 'image': 'assets/burger.jpg', 'price': '\$7'},
        ];
        break;

      case 'Drinks':
        items = [
          {'name': 'Pepsi', 'desc': 'Bottle 2\$ / Can 1\$', 'image': 'assets/drinks.jpg', 'price': '\$2'},
          {'name': 'Miranda', 'desc': 'Bottle 2\$ / Can 1\$', 'image': 'assets/drinks.jpg', 'price': '\$2'},
          {'name': '7 Up', 'desc': 'Bottle 2\$ / Can 1\$', 'image': 'assets/drinks.jpg', 'price': '\$2'},
          {'name': 'Diet', 'desc': 'Bottle 2\$ / Can 1\$', 'image': 'assets/drinks.jpg', 'price': '\$2'},
          {'name': 'Water Small', 'desc': '', 'image': 'assets/water.jpg', 'price': '\$0.5'},
          {'name': 'Water Large', 'desc': '', 'image': 'assets/water.jpg', 'price': '\$1'},
          {'name': 'Ice Tea Peach', 'desc': '', 'image': 'assets/icetea.jpg', 'price': '\$1.5'},
          {'name': 'Ice Tea Lemon', 'desc': '', 'image': 'assets/icetea.jpg', 'price': '\$1.5'},
          {'name': 'Ice Tea Zero', 'desc': '', 'image': 'assets/icetea.jpg', 'price': '\$1.5'},
          {'name': 'Orange Fresh Juice', 'desc': '', 'image': 'assets/juice.jpg', 'price': '\$4'},
          {'name': 'Mango Fresh Juice', 'desc': '', 'image': 'assets/juice.jpg', 'price': '\$5'},
          {'name': 'Pineapple Fresh Juice', 'desc': '', 'image': 'assets/juice.jpg', 'price': '\$5.5'},
          {'name': 'Lemonade Fresh Juice', 'desc': '', 'image': 'assets/juice.jpg', 'price': '\$3.5'},
          {'name': 'Minted Lemonade Fresh Juice', 'desc': '', 'image': 'assets/juice.jpg', 'price': '\$4'},
          {'name': 'Cocktail Juice with Fresh Fruits', 'desc': '', 'image': 'assets/juice.jpg', 'price': '\$8'},
        ];
        break;

      case 'Desserts':
        items = [
          {'name': 'Chocolate Cake', 'desc': '', 'image': 'assets/dessert.jpg', 'price': '\$5'},
          {'name': 'Tiramisu', 'desc': '', 'image': 'assets/dessert.jpg', 'price': '\$6'},
          {'name': 'Caramel Cake', 'desc': '', 'image': 'assets/dessert.jpg', 'price': '\$6'},
          {'name': 'Cheese Cake', 'desc': '', 'image': 'assets/dessert.jpg', 'price': '\$5.5'},
          {'name': 'Brownie Pudding', 'desc': '', 'image': 'assets/dessert.jpg', 'price': '\$6.5'},
        ];
        break;

      default:
        showToast(context, title: '$name Selected', description: 'Full menu coming soon!');
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MenuDetailPage(category: name, items: items),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 18),
      child: Column(
        children: [
          Text('Our Menu',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
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
                childAspectRatio: 0.85,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12),
            itemBuilder: (context, i) {
              final cat = categories[i];
              return GestureDetector(
                onTap: () => _onCategoryTap(context, cat['name']!),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withValues(alpha:0.03),
                          blurRadius: 8,
                          offset: const Offset(0, 6))
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16)),
                              child: Image.asset(cat['image']!,
                                  fit: BoxFit.cover, width: double.infinity))),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cat['name']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16)),
                            const SizedBox(height: 6),
                            Text(cat['desc']!,
                                style: const TextStyle(
                                    color: AppColors.muted, fontSize: 13)),
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
      ),
    );
  }
}
