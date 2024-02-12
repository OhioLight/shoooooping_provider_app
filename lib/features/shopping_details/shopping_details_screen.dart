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
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 0, 41, 74),
                Color.fromARGB(255, 0, 52, 2)
              ],
            ),
          ),
        ),
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
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.center,
              'Name: ${product.name}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(product.image))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Description: ${product.description}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              textAlign: TextAlign.center,
              'Price: ${product.price} €',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decorationColor: Colors.white,
                  decoration: TextDecoration.underline),
            ),
            const Expanded(child: SizedBox()),
            Container(
              height: 45,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 0, 41, 74),
                      Color.fromARGB(255, 0, 52, 2)
                    ],
                  )),
              child: ElevatedButton(
                style: const ButtonStyle(
                    shadowColor: MaterialStatePropertyAll(Colors.transparent),
                    surfaceTintColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    overlayColor: MaterialStatePropertyAll(
                        Color.fromARGB(25, 255, 255, 255)),
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.transparent,
                    ),
                    foregroundColor:
                        MaterialStatePropertyAll(Colors.transparent)),
                onPressed: () {
                  cartProvider.addToCart(product);
                },
                child: const Text(
                  'Zum Warenkorb hinzufügen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
