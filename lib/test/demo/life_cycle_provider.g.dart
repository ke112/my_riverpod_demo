// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_cycle_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPostControllerHash() =>
    r'b370c763995384c175a5e4896887a637ed5cfd3c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FetchPostController
    extends BuildlessAutoDisposeAsyncNotifier<String> {
  late final String postId;

  FutureOr<String> build({
    required String postId,
  });
}

/// See also [FetchPostController].
@ProviderFor(FetchPostController)
const fetchPostControllerProvider = FetchPostControllerFamily();

/// See also [FetchPostController].
class FetchPostControllerFamily extends Family<AsyncValue<String>> {
  /// See also [FetchPostController].
  const FetchPostControllerFamily();

  /// See also [FetchPostController].
  FetchPostControllerProvider call({
    required String postId,
  }) {
    return FetchPostControllerProvider(
      postId: postId,
    );
  }

  @override
  FetchPostControllerProvider getProviderOverride(
    covariant FetchPostControllerProvider provider,
  ) {
    return call(
      postId: provider.postId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchPostControllerProvider';
}

/// See also [FetchPostController].
class FetchPostControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FetchPostController, String> {
  /// See also [FetchPostController].
  FetchPostControllerProvider({
    required String postId,
  }) : this._internal(
          () => FetchPostController()..postId = postId,
          from: fetchPostControllerProvider,
          name: r'fetchPostControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPostControllerHash,
          dependencies: FetchPostControllerFamily._dependencies,
          allTransitiveDependencies:
              FetchPostControllerFamily._allTransitiveDependencies,
          postId: postId,
        );

  FetchPostControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  FutureOr<String> runNotifierBuild(
    covariant FetchPostController notifier,
  ) {
    return notifier.build(
      postId: postId,
    );
  }

  @override
  Override overrideWith(FetchPostController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchPostControllerProvider._internal(
        () => create()..postId = postId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FetchPostController, String>
      createElement() {
    return _FetchPostControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPostControllerProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchPostControllerRef on AutoDisposeAsyncNotifierProviderRef<String> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _FetchPostControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FetchPostController, String>
    with FetchPostControllerRef {
  _FetchPostControllerProviderElement(super.provider);

  @override
  String get postId => (origin as FetchPostControllerProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
