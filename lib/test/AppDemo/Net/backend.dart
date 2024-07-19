import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final serviceProvider = Provider<Dio>((ref) {
  return Dio();
});
