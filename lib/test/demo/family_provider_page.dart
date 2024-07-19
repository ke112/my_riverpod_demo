import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_riverpod_demo/test/demo/family_provider.dart';

class FamilyProviderPage extends ConsumerWidget {
  const FamilyProviderPage({required this.pid, super.key});
  final String pid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productDetailController = ref.watch(productDetailProvider(productId: pid));
    return Scaffold(
      appBar: AppBar(
        title: Text('product deital:$pid'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('pid:${productDetailController.value ?? ''}'),
          ),
          MaterialButton(
            onPressed: () {
              final pid = '${Random().nextInt(999999)}';
              print('FamilyProviderPage next pid:$pid');
              GoRouter.of(context).push('/productdetail', extra: pid);
            },
            child: const Text('点我进入下个商品详情页'),
          )
        ],
      ),
    );
  }
}
