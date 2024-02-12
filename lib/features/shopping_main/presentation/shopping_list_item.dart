import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoooooping_provider_app/common/domain/product.dart';
import 'package:shoooooping_provider_app/common/presentation/shopping_cart_provider.dart';
import 'package:shoooooping_provider_app/features/shopping_details/shopping_details_screen.dart';

class ShoppingListItem extends StatelessWidget {
  final Product product;

  const ShoppingListItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return SizedBox(
      height: 90,
      child: Card(
        color: const Color.fromARGB(255, 43, 43, 43),
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShoppingDetailsScreen(
                          product: product,
                        )));
          },
          title: Text(
            product.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.description,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(color: Color.fromARGB(255, 170, 170, 170)),
              ),
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                      color: Color.fromARGB(255, 170, 170, 170)),
                  text: 'Price:',
                  children: <TextSpan>[
                    TextSpan(
                        text: '${product.price}€',
                        style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        )),
                  ],
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              cartProvider.addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('${product.name} wurde zum Warenkorb hinzugefügt.'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
