import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoooooping_provider_app/common/domain/product.dart';
import 'package:shoooooping_provider_app/common/presentation/shopping_cart_button.dart';
import 'package:shoooooping_provider_app/common/presentation/shopping_cart_provider.dart';

class ShoppingDetailsScreen extends StatelessWidget {
  final Product product;

  const ShoppingDetailsScreen({Key? key, required this.product})
      : super(key: key);

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
          'Details',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          ShoppingCartButton(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Name: ${product.name}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Description: ${product.description}',
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              textAlign: TextAlign.center,
              'Price: ${product.price}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                overlayColor:
                    MaterialStatePropertyAll(Color.fromARGB(25, 255, 255, 255)),
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 43, 43, 43),
                ),
              ),
              onPressed: () {
                cartProvider.addToCart(product);
              },
              child: const Text(
                'Zum Warenkorb hinzufügen',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
