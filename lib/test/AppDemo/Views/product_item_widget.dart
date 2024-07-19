import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_demo/test/AppDemo/Model/product_info.dart';
import 'package:my_riverpod_demo/test/AppDemo/Controllers/product_logic_controller.dart';

class ProductItemWidget extends ConsumerWidget {
  const ProductItemWidget(
      {required this.productInfo, required this.index, super.key});
  final ProductInfo productInfo;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      color: productInfo.isUserBrowser() ? Colors.red[300] : Colors.white,
      onPressed: null,
      onLongPress: () => ref
          .read(productFetchControllerProvider.notifier)
          .tagProductViewed(index),
      child: ListTile(
        title: Text(productInfo.name ?? ''),
        subtitle: Text(productInfo.description ?? ''),
      ),
    );
  }
}
