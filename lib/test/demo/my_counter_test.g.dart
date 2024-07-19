// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_counter_test.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gCounterHash() => r'f2679b7fb1f1320869f83585088f87bae8f2e6f9';

/// See also [GCounter].
@ProviderFor(GCounter)
final gCounterProvider = AutoDisposeNotifierProvider<GCounter, int>.internal(
  GCounter.new,
  name: r'gCounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gCounterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GCounter = AutoDisposeNotifier<int>;
String _$myCounterStreamHash() => r'08572e4a1845589699697c124d73ee70cbb783bc';

/// See also [MyCounterStream].
@ProviderFor(MyCounterStream)
final myCounterStreamProvider =
    AutoDisposeStreamNotifierProvider<MyCounterStream, int>.internal(
  MyCounterStream.new,
  name: r'myCounterStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myCounterStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MyCounterStream = AutoDisposeStreamNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
