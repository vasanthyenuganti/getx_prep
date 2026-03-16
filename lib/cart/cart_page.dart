import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prep/cart/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        actions: [
          Obx(() => cartController.favCartItems.isEmpty
              ? const SizedBox.shrink()
              : TextButton.icon(
                  onPressed: () {
                    for (int i =
                            cartController.favCartItems.length - 1;
                        i >= 0;
                        i--) {
                      cartController.removeFavCart(i);
                    }
                  },
                  icon: const Icon(Icons.delete_sweep_outlined),
                  label: const Text('Clear'),
                )),
          const SizedBox(width: 8),
        ],
      ),
      body: Obx(() {
        if (cartController.favCartItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_cart_outlined,
                    size: 80, color: scheme.outlineVariant),
                const SizedBox(height: 16),
                Text(
                  'Your cart is empty',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Add some items from the shop',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.outline,
                      ),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          itemCount: cartController.favCartItems.length,
          itemBuilder: (context, index) {
            final item = cartController.favCartItems[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                leading: CircleAvatar(
                  backgroundColor: Colors.red.shade50,
                  child: Icon(Icons.favorite,
                      color: Colors.red.shade400, size: 20),
                ),
                title: Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'In your favourites',
                  style: TextStyle(
                    fontSize: 12,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete_outline, color: scheme.error),
                  tooltip: 'Remove',
                  onPressed: () => cartController.removeFavCart(index),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}