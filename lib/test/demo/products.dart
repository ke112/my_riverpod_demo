import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_demo/test/demo/product_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'products.g.dart';

// @riverpod
// FutureOr<List<ProductEntity>> products(Ref ref) async {
//   String url = "https://wpapi.ducafecat.tech/products";
//   Response response = await Dio().get(url);

//   List<ProductEntity> list = [];
//   for (var item in response.data) {
//     list.add(ProductEntity.fromJson(item));
//   }
//   return list;
// }

class ProductRepository {
  ProductRepository();
  final Dio dio = Dio();

  Future<List<ProductEntity>> getProductsData({required String page}) async {
    String url = "https://wpapi.ducafecat.tech/products";
    Response response = await Dio().get(url);
    print('[ProductsInfo] build methos');
    List<ProductEntity> list = [];
    for (var item in response.data) {
      list.add(ProductEntity.fromJson(item));
    }
    return list;
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepository();
}

@riverpod
class EditProductController extends _$EditProductController {
  @override
  FutureOr<void> build() {}

  Future<void> fetchProducts({required String page}) async {
    final prodcutsRepository = ref.read(productRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      prodcutsRepository.getProductsData(page: page);
    });
  }
}

@riverpod
class ProductController extends _$ProductController {
  @override
  FutureOr<List<ProductEntity>> build({required String page}) async {
    final prodcutsRepository = ref.read(productRepositoryProvider);
    final result = prodcutsRepository.getProductsData(page: page);

    return result;
  }
}
