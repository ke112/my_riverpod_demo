import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_demo/test/AppDemo/Controllers/product_logic_controller.dart';
import 'package:my_riverpod_demo/test/AppDemo/Views/product_item_widget.dart';

class UserProductsPage extends ConsumerWidget {
  const UserProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataProvider = ref.watch(productFetchControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '商品展示',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue[600],
        actions: [
          DropdownButton(
              dropdownColor: Colors.lightBlue[100],
              value: ref.watch(actionTypeProvider),
              items: const [
                DropdownMenuItem(value: ActionType.loadmore, child: Text('加载更多')),
                DropdownMenuItem(value: ActionType.refresh, child: Text('刷新')),
                DropdownMenuItem(value: ActionType.load, child: Text('首次加载')),
                DropdownMenuItem(value: ActionType.delete, child: Text('删除第一个产品')),
              ],
              onChanged: (value) {
                //更新当前选项的显示
                ref.read(actionTypeProvider.notifier).state = value!;
                //业务逻辑
                if (value == ActionType.refresh) {
                  ref.read(productFetchControllerProvider.notifier).refreshProductInfos();
                } else if (value == ActionType.loadmore) {
                  ref.read(productFetchControllerProvider.notifier).loadMoreProoduct(parameter: "xx", offset: 1);
                } else if (value == ActionType.load) {
                  ref.read(productFetchControllerProvider.notifier).refreshProductInfos();
                } else if (value == ActionType.delete) {
                  ref.read(productFetchControllerProvider.notifier).removeProductAtIndex(0);
                }
              })
        ],
      ),
      body: dataProvider.when(
          data: (products) => ListView.builder(
                itemBuilder: (context, index) {
                  final productInfo = products[index];
                  // return MaterialButton(
                  //   color: productInfo.isUserBrowser() ? Colors.red[300] : Colors.white,
                  //   onPressed: null,
                  //   onLongPress: () => ref.read(productFetchControllerProvider.notifier).tagProductViewed(index),
                  //   child: ListTile(
                  //     title: Text(productInfo.name ?? ''),
                  //     subtitle: Text(productInfo.description ?? ''),
                  //   ),
                  // );

                  // 封装
                  return ProductItemWidget(productInfo: productInfo, index: index);
                },
                itemCount: products.length,
                shrinkWrap: true,
              ),
          error: (err, stack) => Text('加载错误:$err'),
          loading: () => Center(
                child: CircularProgressIndicator(
                  color: Colors.green[600],
                ),
              )),
    );
  }
}
