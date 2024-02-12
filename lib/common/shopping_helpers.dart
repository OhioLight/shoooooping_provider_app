import 'package:shoooooping_provider_app/common/domain/product.dart';

List<Product> getDefaultProducts() {
  int id = 1;

  return [
    Product(
      id++,
      'Provider',
      'Provides a static value',
      3.99,
    ),
    Product(
      id++,
      'ChangeNotifierProvider',
      'Listens to a ChangeNotifier',
      4.99,
    ),
    Product(
      id++,
      'ChangeNotifierProxyProvider',
      'Listens to a ChangeNotifier and provides a new value based on the ChangeNotifier',
      12.99,
    ),
    Product(
      id++,
      'Provider.value',
      'Provides a value that never changes',
      0.99,
    ),
    Product(
      id++,
      'Provider.of',
      'Listens to a value and rebuilds when the value changes',
      1.99,
    ),
    Product(
      id++,
      'ProviderListener',
      'Listens to a value and calls a callback when the value changes',
      0.49,
    ),
    Product(
      id++,
      'MultiProvider',
      'Provides multiple values',
      5.99,
    ),
    Product(
      id++,
      'Consumer',
      'Listens to a value and rebuilds when the value changes',
      2.99,
    ),
    Product(
      id++,
      'Selector',
      'Equivalent to Consumer but can filter values',
      3.99,
    ),
    Product(
      id++,
      'context.read<T>()',
      'Gets a value without listening or rebuilding',
      0.99,
    ),
    Product(
      id++,
      'context.watch<T>()',
      'Listens to a value and rebuilds',
      0.99,
    ),
    Product(
      id++,
      'context.select<T, R>(R cb(T value))',
      'Listen to only a part of a value and rebuild',
      7.99,
    ),
  ];
}
