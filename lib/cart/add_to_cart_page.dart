import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prep/cart/cart_controller.dart';
import 'package:getx_prep/cart/cart_page.dart';

class AddToCartPage extends StatelessWidget {
  const AddToCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          IconButton(
            tooltip: 'My Cart',
            onPressed: () => Get.to(() => const CartPage()),
            icon: Badge(
              label: Obx(() => Text(
                    cartController.favCartItems.length.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        itemCount: cartController.cartItems.length,
        itemBuilder: (context, index) {
          final item = cartController.cartItems[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              leading: CircleAvatar(
                backgroundColor: scheme.primaryContainer,
                child: Text(
                  item.name[0],
                  style: TextStyle(
                    color: scheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Obx(() => Text(
                    item.favCart.value ? 'Added to favourites' : 'Tap to add',
                    style: TextStyle(
                      fontSize: 12,
                      color: item.favCart.value
                          ? scheme.primary
                          : scheme.onSurfaceVariant,
                    ),
                  )),
              trailing: Obx(() => IconButton(
                    icon: Icon(
                      item.favCart.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                          item.favCart.value ? Colors.red : scheme.outline,
                    ),
                    onPressed: () {
                      if (item.favCart.value) {
                        cartController.rmFavCart(item, index);
                      } else {
                        cartController.addFavCart(item);
                      }
                    },
                  )),
            ),
          );
        },
      ),
    );
  }
}