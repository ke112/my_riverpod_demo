import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//replace with part 'name_of_your_file.freezed.dart';
part 'async_notifier_list_provider.freezed.dart';
part 'async_notifier_list_provider.g.dart';

@freezed
class Product with _$Product {
  const Product._();
  const factory Product({
    String? name,
    String? description,
  }) = _Product;
}

const Product _product1 = Product(
    name: "Dart 公开课",
    description: "Dart 从入门到放弃");
final Product _product2 =
    _product1.copyWith(description: "Dart 从入门到进阶");
final Product _product3 =
    _product1.copyWith(name: "HarmonyOS 公开课", description: '每天写一点点Arkts');

final products = [
  _product1,
  _product2,
  _product3,
];

@riverpod
class AsyncProducts extends _$AsyncProducts {
  Future<List<Product>> _fetchProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    return products;
  }

  @override
  FutureOr<List<Product>> build() async {
    return _fetchProducts();
  }

  Future<void> clearProducts() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 3));
      return [];
    });
  }
}
