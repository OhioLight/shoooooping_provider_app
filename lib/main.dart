import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoooooping_provider_app/common/presentation/shopping_cart_provider.dart';
import 'package:shoooooping_provider_app/common/presentation/shopping_product_provider.dart';
import 'package:shoooooping_provider_app/shopping_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: ShoppingApp()),
    ),
  );
}
