// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'async_value_test.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherRepositoryHash() => r'a7559db7c34944c57f70522b7a46f5cc603e571e';

/// See also [weatherRepository].
@ProviderFor(weatherRepository)
final weatherRepositoryProvider =
    AutoDisposeProvider<WeatherRepository>.internal(
  weatherRepository,
  name: r'weatherRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WeatherRepositoryRef = AutoDisposeProviderRef<WeatherRepository>;
String _$fetchWeatherHash() => r'5b6b19c85bcb8ad87119b558e9490378eb25758c';

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

/// See also [fetchWeather].
@ProviderFor(fetchWeather)
const fetchWeatherProvider = FetchWeatherFamily();

/// See also [fetchWeather].
class FetchWeatherFamily extends Family<AsyncValue<Weather>> {
  /// See also [fetchWeather].
  const FetchWeatherFamily();

  /// See also [fetchWeather].
  FetchWeatherProvider call(
    String city,
  ) {
    return FetchWeatherProvider(
      city,
    );
  }

  @override
  FetchWeatherProvider getProviderOverride(
    covariant FetchWeatherProvider provider,
  ) {
    return call(
      provider.city,
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
  String? get name => r'fetchWeatherProvider';
}

/// See also [fetchWeather].
class FetchWeatherProvider extends AutoDisposeFutureProvider<Weather> {
  /// See also [fetchWeather].
  FetchWeatherProvider(
    String city,
  ) : this._internal(
          (ref) => fetchWeather(
            ref as FetchWeatherRef,
            city,
          ),
          from: fetchWeatherProvider,
          name: r'fetchWeatherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchWeatherHash,
          dependencies: FetchWeatherFamily._dependencies,
          allTransitiveDependencies:
              FetchWeatherFamily._allTransitiveDependencies,
          city: city,
        );

  FetchWeatherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.city,
  }) : super.internal();

  final String city;

  @override
  Override overrideWith(
    FutureOr<Weather> Function(FetchWeatherRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchWeatherProvider._internal(
        (ref) => create(ref as FetchWeatherRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        city: city,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Weather> createElement() {
    return _FetchWeatherProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchWeatherProvider && other.city == city;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, city.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchWeatherRef on AutoDisposeFutureProviderRef<Weather> {
  /// The parameter `city` of this provider.
  String get city;
}

class _FetchWeatherProviderElement
    extends AutoDisposeFutureProviderElement<Weather> with FetchWeatherRef {
  _FetchWeatherProviderElement(super.provider);

  @override
  String get city => (origin as FetchWeatherProvider).city;
}

String _$myNotifierHash() => r'bfee237edb295a6c094dd5469acffedcf7ab22fa';

/// See also [MyNotifier].
@ProviderFor(MyNotifier)
final myNotifierProvider =
    AutoDisposeAsyncNotifierProvider<MyNotifier, MyData>.internal(
  MyNotifier.new,
  name: r'myNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$myNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MyNotifier = AutoDisposeAsyncNotifier<MyData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
