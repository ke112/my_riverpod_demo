import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'family_provider.g.dart';

@riverpod
class ProductDetail extends _$ProductDetail {
  @override
  FutureOr<String> build({required String productId}) {
    print('ProductDetail hascode:$hashCode, pid:$productId');
    final random = Random();
    final str = '$productId _${random.nextInt(Colors.primaries.length)}';
    return str;
  }
}
