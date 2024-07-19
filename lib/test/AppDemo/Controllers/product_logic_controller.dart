import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_riverpod_demo/test/AppDemo/Model/product_info.dart';
import 'package:my_riverpod_demo/test/AppDemo/Net/backend.dart';
import 'package:my_riverpod_demo/test/AppDemo/Net/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'product_logic_controller.g.dart';

enum ActionType { load, refresh, loadmore, delete }

final actionTypeProvider = StateProvider.autoDispose<ActionType>((ref) {
  print('actionTypeProvider init');
  return ActionType.load;
});

@riverpod
class ProductFetchController extends _$ProductFetchController {

  //关于资源的释放
  late Timer timer;
  int counter = 0;

  @override
  FutureOr<List<ProductInfo>> build() async {

    //关于资源释放的演示
    tryToReleaseResource();

    return await _initialize();
  }

  //关于资源的释放
  void tryToReleaseResource() {
   // 初始化定时器
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      counter++;
      print("timer is active:$counter");
    });
 
    //释放资源
    ref.onDispose(() {
      print("ProductFetchController on dispose");
      timer.cancel();
    });
  }

  Future<List<ProductInfo>> _initialize() async {
    final repository = ref.read(productInfosRepositoryProvider);

    //方法1
    // // 设置加载状态
    // state = const AsyncValue.loading();

    // state = await AsyncValue.guard(() async {
    //   return repository.fetchProducts(parameter: "0", offset: 0);
    // });

    // // 检查状态是否成功，如果成功返回数据，否则抛出异常
    // if (state.hasError) {
    //   throw state.error!;
    // }

    // return state.value ?? [];

    //方法2
    return repository.fetchProducts(parameter: "0", offset: 0);
  }

  FutureOr<void> refreshProductInfos() async {
    final repository = ref.read(productInfosRepositoryProvider);
    // 设置加载状态
    state = const AsyncValue.loading();

    // 尝试刷新数据
    //方法1
    state = await AsyncValue.guard(() async {
      return repository.fetchProducts(parameter: "0", offset: 0);
    });
    //方法2
    // try {
    //   final result = await repository.fetchProducts(parameter: "0", offset: 0);

    //   // 更新状态为数据加载完成
    //   state = AsyncValue.data(result);
    // } catch (e, st) {
    //   // 如果出现错误，更新状态为错误状态
    //   state = AsyncValue.error(e, st);
    //   rethrow;
    // }
  }

  FutureOr<void> loadMoreProoduct(
      {required String parameter, required int offset}) async {
    //如果当前状态是加载中，不执行
    if (state.isLoading) return;

    final repository = ref.read(productInfosRepositoryProvider);
    state = await AsyncValue.guard(() async {
      final result =
          await repository.fetchProducts(parameter: parameter, offset: offset);

      final currentState = state;
      // 将 currentState.valueOrNull 转换为 List<ProductInfo>，如果为 null，则使用空列表 []
      final List<ProductInfo> currentList =
          (currentState.valueOrNull ?? []).cast<ProductInfo>();

      // 合并新数据和现有数据
      final newState = [
        ...currentList,
        ...result,
      ];

      // 更新状态为数据加载完成
      state = AsyncValue.data(newState);

      return state.value!;
    });
  }

  Future<void> removeProductAtIndex(int index) async {
    //异常处理
    if (state.isLoading || state.hasError) return;
    //数组越界
    if (index >= (state.valueOrNull ?? []).length) return;
    //业务逻辑
    final repository = ref.read(productInfosRepositoryProvider);
    final result = await repository.removeProductAtIndex(index);
    //删除成功
    if (result) {
      //方法1: 尝试重新获取更新后的数据 重新拉去远程数据
      // final newList = await repository.fetchProducts(parameter: "0", offset: 0);
      // state = AsyncValue.data(newList);

      //方法2 直接在本地更新数据，不重新拉取列表
      final List<ProductInfo> newList = List.from(state.valueOrNull ?? [])
        ..removeAt(index);
      state = AsyncValue.data(newList);
    }
  }

  Future<void> tagProductViewed(int idx) async {
    //异常处理
    if (state.isLoading || state.hasError) return;
    //数组越界
    if (idx >= (state.valueOrNull ?? []).length) return;

    final List<ProductInfo> newList = List.from(state.valueOrNull ?? []);
    final ProductInfo productInfo = newList[idx];
    productInfo.setUserBrowsered(true);

    state = AsyncValue.data(newList);
  }
}
