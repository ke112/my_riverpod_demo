import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_demo/viewModel/product_future_provider.dart';

class FutuerProviderPage extends ConsumerWidget {
  const FutuerProviderPage({required this.pageName, super.key});
  final String pageName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsProvider = ref.watch(futuerProductsProvider);
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text(pageName),
          actions: [
            DropdownButton(
                dropdownColor: Colors.lightBlue,
                value: ref.watch(productSortTypeProvider),
                items: const [
                  DropdownMenuItem(
                      value: ProductSortType.name,
                      child: Text('字母排序')),
                  DropdownMenuItem(
                      value: ProductSortType.price, child: Text('价格排序'))
                ],
                onChanged: (value) =>
                    ref.read(productSortTypeProvider.notifier).state = value!)
          ],
        ),
        body: Column(
          children: [
            productsProvider.when(
              data: (products) => ListView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Container(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Card(
                          color: Colors.blueAccent,
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              product.name,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                            subtitle: Text(
                              '${product.price}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ));
                  }),
              error: (err, stack) => Text('err: $err'),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ));
  }
}
