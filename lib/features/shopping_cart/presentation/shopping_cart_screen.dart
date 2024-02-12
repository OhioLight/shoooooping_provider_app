import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoooooping_provider_app/common/presentation/shopping_cart_provider.dart';
import 'package:shoooooping_provider_app/features/shopping_cart/presentation/shopping_cart_item.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 11, 41),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 43, 43),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        title: const Text(
          'Warenkorb',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.toSet().length,
        itemBuilder: (context, index) {
          final uniqueProducts = cartProvider.cartItems.toSet().toList();
          final product = uniqueProducts[index];

          final itemCount = cartProvider.getItemCount(product);

          return ShoppingCartItem(
              cartProvider: cartProvider,
              product: product,
              itemCount: itemCount);
        },
      ),
    );
  }
}
