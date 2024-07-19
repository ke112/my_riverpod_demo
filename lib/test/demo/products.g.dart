// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productRepositoryHash() => r'1143e6a957468f07814b030b8e53d8ea1ddb037b';

/// See also [productRepository].
@ProviderFor(productRepository)
final productRepositoryProvider =
    AutoDisposeProvider<ProductRepository>.internal(
  productRepository,
  name: r'productRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductRepositoryRef = AutoDisposeProviderRef<ProductRepository>;
String _$editProductControllerHash() =>
    r'13002816dcf56888d5bcd65b1a37591ed37acbd0';

/// See also [EditProductController].
@ProviderFor(EditProductController)
final editProductControllerProvider =
    AutoDisposeAsyncNotifierProvider<EditProductController, void>.internal(
  EditProductController.new,
  name: r'editProductControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$editProductControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EditProductController = AutoDisposeAsyncNotifier<void>;
String _$productControllerHash() => r'0e60c7ef6660ffac63fcf49954b69135767926af';

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

abstract class _$ProductController
    extends BuildlessAutoDisposeAsyncNotifier<List<ProductEntity>> {
  late final String page;

  FutureOr<List<ProductEntity>> build({
    required String page,
  });
}

/// See also [ProductController].
@ProviderFor(ProductController)
const productControllerProvider = ProductControllerFamily();

/// See also [ProductController].
class ProductControllerFamily extends Family<AsyncValue<List<ProductEntity>>> {
  /// See also [ProductController].
  const ProductControllerFamily();

  /// See also [ProductController].
  ProductControllerProvider call({
    required String page,
  }) {
    return ProductControllerProvider(
      page: page,
    );
  }

  @override
  ProductControllerProvider getProviderOverride(
    covariant ProductControllerProvider provider,
  ) {
    return call(
      page: provider.page,
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
  String? get name => r'productControllerProvider';
}

/// See also [ProductController].
class ProductControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ProductController, List<ProductEntity>> {
  /// See also [ProductController].
  ProductControllerProvider({
    required String page,
  }) : this._internal(
          () => ProductController()..page = page,
          from: productControllerProvider,
          name: r'productControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productControllerHash,
          dependencies: ProductControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductControllerFamily._allTransitiveDependencies,
          page: page,
        );

  ProductControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final String page;

  @override
  FutureOr<List<ProductEntity>> runNotifierBuild(
    covariant ProductController notifier,
  ) {
    return notifier.build(
      page: page,
    );
  }

  @override
  Override overrideWith(ProductController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductControllerProvider._internal(
        () => create()..page = page,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductController,
      List<ProductEntity>> createElement() {
    return _ProductControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductControllerProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<ProductEntity>> {
  /// The parameter `page` of this provider.
  String get page;
}

class _ProductControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductController,
        List<ProductEntity>> with ProductControllerRef {
  _ProductControllerProviderElement(super.provider);

  @override
  String get page => (origin as ProductControllerProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
