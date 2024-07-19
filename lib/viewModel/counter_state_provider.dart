import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) {
  return "stateProvider 演示";
});

final counterProvider = StateProvider<int>((ref) {
  return 0;
});
