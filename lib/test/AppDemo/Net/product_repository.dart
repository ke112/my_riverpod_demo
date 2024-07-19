import 'package:dio/dio.dart';
import 'package:my_riverpod_demo/test/AppDemo/Model/product_info.dart';
import 'package:my_riverpod_demo/test/AppDemo/Net/backend.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

class ProductInfosRepository {
  ProductInfosRepository({required this.dio});
  final Dio dio;

  Future<List<ProductInfo>> fetchProducts({required String parameter, required int offset}) async {
    String url = "https://wpapi.ducafecat.tech/products";
    Response response = await dio.get(url);
    print('[ProductsInfo] fetchProducts methos');
    List<ProductInfo> list = [];
    for (var item in response.data) {
      try {
        list.add(ProductInfo.fromJson(item));
      } catch (e) {
        print("err: $e");
      }
    }
    return list;
  }

  Future<bool> removeProductAtIndex(int index) async {
    //模拟网络
    await Future.delayed(const Duration(seconds: 1));
    return Future.value(true);
  }
}

@riverpod
ProductInfosRepository productInfosRepository(ProductInfosRepositoryRef ref) {
  final dio = ref.read(serviceProvider);
  return ProductInfosRepository(dio: dio);
}
