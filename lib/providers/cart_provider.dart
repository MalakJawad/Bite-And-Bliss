import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final String description;
  final String? image;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.description,
    this.image,
    required this.price,
    this.quantity = 1,
  });

  double get total => price * quantity;
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addToCart({
    required String id,
    required String name,
    required String description,
    String? image,
    required double price,
    int quantity = 1,
  }) {
    final index = _items.indexWhere((e) => e.id == id);
    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(
        id: id,
        name: name,
        description: description,
        image: image,
        price: price,
        quantity: quantity,
      ));
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    _items.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  void updateQuantity(String id, int newQuantity) {
    final index = _items.indexWhere((e) => e.id == id);
    if (index >= 0) {
      if (newQuantity <= 0) {
        removeFromCart(id);
        return;
      }
      _items[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  int get totalItems => _items.fold(0, (sum, e) => sum + e.quantity);

  double get subtotal => _items.fold(0.0, (sum, e) => sum + e.total);

  double get deliveryFee => subtotal >= 25 ? 0.0 : 1.5;

  double get tax => subtotal * 0.1; // 10% tax

  double get total => subtotal + tax + deliveryFee;
}
