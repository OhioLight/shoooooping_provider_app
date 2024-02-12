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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
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
              surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
              overlayColor:
                  MaterialStatePropertyAll(Color.fromARGB(25, 255, 255, 255)),
              backgroundColor: MaterialStatePropertyAll(
                Colors.transparent,
              ),
              foregroundColor: MaterialStatePropertyAll(Colors.transparent)),
          onPressed: () {},
          child: Text(
            'Total Amount: ${cartProvider.getTotalAmount().toStringAsFixed(2)} €',
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
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
          'Warenkorb',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.toSet().length,
        itemBuilder: (context, index) {
          final uniqueProducts = cartProvider.cartItems.toSet().toList();
          uniqueProducts.sort((a, b) => a.name.compareTo(b.name));
          final product = uniqueProducts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ShoppingCartItem(
              cartProvider: cartProvider,
              product: product,
            ),
          );
        },
      ),
    );
  }
}
