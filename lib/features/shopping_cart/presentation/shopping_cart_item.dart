import 'package:flutter/material.dart';
import 'package:shoooooping_provider_app/common/domain/product.dart';
import 'package:shoooooping_provider_app/common/presentation/shopping_cart_provider.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    super.key,
    required this.cartProvider,
    required this.product,
    required this.itemCount,
  });

  final CartProvider cartProvider;
  final Product product;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        color: const Color.fromARGB(255, 43, 43, 43),
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
            'Price: ${product.price}',
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
    );
  }
}
