import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoooooping_provider_app/common/presentation/shopping_cart_provider.dart';
import 'package:shoooooping_provider_app/features/shopping_cart/presentation/shopping_cart_screen.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final itemCount = cartProvider.cartItems.length;

    return Stack(
      children: [
        IconButton(
          icon: const Icon(
            Icons.shopping_cart_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ShoppingCartScreen(),
              ),
            );
          },
        ),
        Positioned(
          right: 0,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 10,
            child: Text(
              itemCount.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
