import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoooooping_provider_app/common/presentation/shopping_cart_button.dart';
import 'package:shoooooping_provider_app/common/presentation/shopping_product_provider.dart';
import 'package:shoooooping_provider_app/features/shopping_main/presentation/shopping_list_item.dart';

class ShoppingMainScreen extends StatelessWidget {
  const ShoppingMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

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
        title: const Text(
          'Provider Shopping App',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          ShoppingCartButton(),
        ],
      ),
      body: GridView.builder(
        itemCount: productProvider.getProducts().length,
        itemBuilder: (context, index) {
          final product = productProvider.getProducts()[index];
          return ShoppingListItem(product: product);
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}
