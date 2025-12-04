import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/toast.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String paymentMethod = "card"; // card or cash
  String deliveryMethod = "delivery"; // delivery or pickup
  bool isProcessing = false;
  bool orderPlaced = false;

  // Delivery address controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();
  final _instructionsController = TextEditingController();

  Future<void> placeOrder(CartProvider cart) async {
    setState(() => isProcessing = true);

    // Simulate processing delay
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return; // << Guard context usage

    setState(() {
      isProcessing = false;
      orderPlaced = true;
    });

    cart.clearCart();

    showToast(
      context,
      title: 'Order Confirmed! 🎉',
      description: 'Your delicious food is being prepared!',
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final deliveryFee = deliveryMethod == "delivery" ? cart.deliveryFee : 0.0;
    final tax = cart.subtotal * 0.1;
    final finalTotal = cart.subtotal + tax + deliveryFee;

    if (orderPlaced) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle_outline, size: 72, color: AppColors.primary),
                const SizedBox(height: 16),
                const Text(
                  "Order Confirmed!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text("Thank you for your order. Your food is being prepared with love."),
                const SizedBox(height: 8),
                Text(
                  "Order #ORD-${DateTime.now().millisecondsSinceEpoch.toString().substring(5, 11)}",
                  style: const TextStyle(fontSize: 12, color: AppColors.muted),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                        onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                        child: const Text('Back to Home'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Order More Food'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    if (cart.items.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.shopping_cart_outlined, size: 72, color: AppColors.muted),
              const SizedBox(height: 12),
              const Text('Your cart is empty', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                onPressed: () => Navigator.pop(context),
                child: const Text('Browse Menu'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Delivery Method
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Delivery Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: ChoiceChip(
                            label: const Text("Delivery"),
                            selected: deliveryMethod == "delivery",
                            onSelected: (_) => setState(() => deliveryMethod = "delivery"),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ChoiceChip(
                            label: const Text("Pickup"),
                            selected: deliveryMethod == "pickup",
                            onSelected: (_) => setState(() => deliveryMethod = "pickup"),
                          ),
                        ),
                      ],
                    ),
                    if (deliveryMethod == "delivery")
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text("Fee: ${deliveryFee == 0 ? 'Free' : '\$${deliveryFee.toStringAsFixed(2)}'}"),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Delivery Address
            if (deliveryMethod == "delivery")
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Delivery Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _firstNameController,
                              decoration: const InputDecoration(labelText: "First Name"),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _lastNameController,
                              decoration: const InputDecoration(labelText: "Last Name"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _phoneController,
                        decoration: const InputDecoration(labelText: "Phone Number"),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _streetController,
                        decoration: const InputDecoration(labelText: "Street Address"),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _cityController,
                              decoration: const InputDecoration(labelText: "City"),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _stateController,
                              decoration: const InputDecoration(labelText: "State"),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _zipController,
                              decoration: const InputDecoration(labelText: "ZIP Code"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _instructionsController,
                        decoration: const InputDecoration(labelText: "Delivery Instructions (Optional)"),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 12),

            // Payment Method
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: ChoiceChip(
                            label: const Text("Card"),
                            selected: paymentMethod == "card",
                            onSelected: (_) => setState(() => paymentMethod = "card"),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ChoiceChip(
                            label: const Text("Cash on Delivery"),
                            selected: paymentMethod == "cash",
                            onSelected: (_) => setState(() => paymentMethod = "cash"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Order Summary
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Order Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ...cart.items.map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              if (item.image != null)
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(item.image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              else
                                const Icon(Icons.fastfood, size: 48, color: AppColors.muted),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                    Text("Qty: ${item.quantity}", style: const TextStyle(color: AppColors.muted)),
                                  ],
                                ),
                              ),
                              Text("\$${item.total.toStringAsFixed(2)}"),
                            ],
                          ),
                        )),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal (${cart.totalItems} items)"),
                        Text("\$${cart.subtotal.toStringAsFixed(2)}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Delivery Fee"),
                        Text(deliveryFee == 0 ? "Free" : "\$${deliveryFee.toStringAsFixed(2)}",
                            style: TextStyle(color: deliveryFee == 0 ? AppColors.primary : null)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Tax (10%)"),
                        Text("\$${tax.toStringAsFixed(2)}"),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text("\$${finalTotal.toStringAsFixed(2)}",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: isProcessing ? null : () => placeOrder(cart),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, minimumSize: const Size.fromHeight(48)),
                      child: Text(isProcessing ? "Processing..." : "Place Order • \$${finalTotal.toStringAsFixed(2)}"),
                    ),
                    const SizedBox(height: 8),
                    const Text("Free delivery on orders over \$25", style: TextStyle(fontSize: 12, color: AppColors.muted)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
