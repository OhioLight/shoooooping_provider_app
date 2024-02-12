import 'package:flutter/material.dart';
import 'package:shoooooping_provider_app/common/domain/product.dart';
import 'package:shoooooping_provider_app/common/presentation/shopping_cart_provider.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    Key? key,
    required this.cartProvider,
    required this.product,
  }) : super(key: key);

  final CartProvider cartProvider;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final itemCount = cartProvider.getItemCount(product);

    return SizedBox(
      height: 80,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: const LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Color.fromARGB(255, 0, 41, 74),
                Color.fromARGB(255, 0, 52, 2)
              ],
            ),
          ),
          child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  color: Colors.white,
                  onPressed: () {
                    cartProvider.decreaseQuantity(product);
                  },
                ),
                Text(
                  itemCount.toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    cartProvider.addToCart(product);
                  },
                ),
              ],
            ),
            title: Text(
              product.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Price: ${product.price} €',
              style: const TextStyle(color: Colors.white),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
              onPressed: () {
                cartProvider.removeFromCart(product);
              },
            ),
          ),
        ),
      ),
    );
  }
}
