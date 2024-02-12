import 'package:flutter/material.dart';
import 'package:shoooooping_provider_app/common/domain/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item == product);
    notifyListeners();
  }

  int getItemCount(Product product) {
    return _cartItems.where((item) => item == product).length;
  }

  void decreaseQuantity(Product product) {
    if (_cartItems.contains(product)) {
      _cartItems.remove(product);
      notifyListeners();
    }
  }

  double getTotalAmount() {
    double totalAmount = 0;
    for (var product in _cartItems) {
      totalAmount += product.price;
    }
    return totalAmount;
  }
}
