import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

final _products = [
  Product(name: "ball", price: 10),
  Product(name: "chair", price: 6),
  Product(name: "lamp", price: 9),
  Product(name: "desk", price: 10),
  Product(name: "bowl", price: 2),
];

enum ProductSortType { name, price }

final productSortTypeProvider = StateProvider<ProductSortType>((ref) {
  //obs
  return ProductSortType.name;
});

final futuerProductsProvider = FutureProvider<List<Product>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  final sortType = ref.read(productSortTypeProvider);
  switch (sortType) {
    case ProductSortType.name:
      _products.sort((a, b) => a.name.compareTo(b.name));
      break;
    case ProductSortType.price:
      _products.sort((a, b) => a.price.compareTo(b.price));
      break;
  }
  return _products;
});
