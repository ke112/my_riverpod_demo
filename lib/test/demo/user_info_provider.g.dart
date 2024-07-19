// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'19a3485653561ac2f781b997131430c5659286d1';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String _$userSortHash() => r'bf035f9d53c7940f4d92dfb22d84c39acd9b7e00';

/// See also [UserSort].
@ProviderFor(UserSort)
final userSortProvider =
    AutoDisposeNotifierProvider<UserSort, UserSortType>.internal(
  UserSort.new,
  name: r'userSortProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userSortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserSort = AutoDisposeNotifier<UserSortType>;
String _$fetchUserInfosHash() => r'b739d2d5833144911b56411008783a2224134058';

/// See also [FetchUserInfos].
@ProviderFor(FetchUserInfos)
final fetchUserInfosProvider =
    AutoDisposeAsyncNotifierProvider<FetchUserInfos, List<UserInfo>>.internal(
  FetchUserInfos.new,
  name: r'fetchUserInfosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchUserInfosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FetchUserInfos = AutoDisposeAsyncNotifier<List<UserInfo>>;
String _$userInfoProviderHash() => r'89a48e9c1303394ba00b6c9835782a3a774722d4';

/// See also [UserInfoProvider].
@ProviderFor(UserInfoProvider)
final userInfoProviderProvider =
    AutoDisposeNotifierProvider<UserInfoProvider, List<UserInfo>>.internal(
  UserInfoProvider.new,
  name: r'userInfoProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userInfoProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserInfoProvider = AutoDisposeNotifier<List<UserInfo>>;
String _$authControllerHash() => r'c80af52a1f09646ec313bbb535719e227fe4d375';

/// See also [AuthController].
@ProviderFor(AuthController)
final authControllerProvider =
    AutoDisposeAsyncNotifierProvider<AuthController, void>.internal(
  AuthController.new,
  name: r'authControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
