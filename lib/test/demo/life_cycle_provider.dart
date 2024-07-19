import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'life_cycle_provider.g.dart';

@riverpod
class FetchPostController extends _$FetchPostController {
  Timer? timer;
  @override
  FutureOr<String> build({required String postId}) {
    // 日志， 注意同一个生命周期方法可以多次被使用，如下所示
    print('init: fetchPost($postId)');
    ref.onCancel(() => print('cancel: fetchPost($postId)'));
    ref.onResume(() => print('resume: fetchPost($postId)'));
    ref.onDispose(() => print('dispose: fetchPost($postId)'));

    final link = ref.keepAlive();

    //取消网络请求时使用
    final cancelToken = CancelToken();
    //释放的时候调用
    ref.onDispose(() {
      timer?.cancel();
      cancelToken.cancel();
    });
    //最后一个监听者（使用了watch和listen）被移除时
    ref.onCancel(() {
      //30秒内再次被使用时，不会创建新的provider
      timer = Timer(const Duration(seconds: 30), () {
        link.close();
      });
    });
    //provider没有监听者后被重新使用的时候
    ref.onResume(() {
      timer?.cancel();
    });
    //新增监听者的时候的回调
    ref.onAddListener(() {
      print("onAddListener");
    });
    //移除监听者的时候的回调
    ref.onRemoveListener(() {
      print("onRemoveListener");
    });

    //模拟网络请求直接返回的值
    return "This is a lifecycle test";
  }
}
