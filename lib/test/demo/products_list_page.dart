import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_demo/test/demo/product_entity.dart';
import 'package:my_riverpod_demo/test/demo/products.dart';

class ProductsListPage extends ConsumerWidget {
  const ProductsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsControllerProvider = ref.watch(productControllerProvider(page: 'page'));
    final products = ref.read(editProductControllerProvider.notifier).fetchProducts(page: 'xxx');
    return Scaffold(
      appBar: AppBar(
        title: const Text('app network'),
        actions: [
          MaterialButton(
            onPressed: () => ref.read(editProductControllerProvider.notifier).fetchProducts(page: 'xxx'),
            child: const Icon(Icons.delete),
          )
        ],
      ),
      body: _buildView(productsControllerProvider),
    );
  }

  Widget _buildView(AsyncValue<List<ProductEntity>> products) {
    //   return Center(
    //     child: switch (products) {
    //       // 4 根据状态显示不同的视图
    // AsyncData<List<ProductEntity>>(:final value) => ListView.builder(
    //     itemCount: value.length,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         title: Text(value[index].name ?? ""),
    //         subtitle: Text(value[index].description ?? ""),
    //       );
    //     },
    //         ),
    //       // 5 错误处理
    //       AsyncError() => const Text('Oops, something unexpected happened'),
    //       // 6 加载中
    //       _ => const CircularProgressIndicator(),
    //     },
    //   );
    return Center(
      child: products.when(
          data: (value) => ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(value[index].name ?? ""),
                    subtitle: Text(value[index].description ?? ""),
                  );
                },
              ),
          error: (err, stack) => const Text('Oops, something unexpected happened'),
          loading: () => const CircularProgressIndicator()),
    );
  }
}
