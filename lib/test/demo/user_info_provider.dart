import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_info_provider.g.dart';

class UserInfo {
  String name;
  int age;

  UserInfo({required this.name, required this.age});
}

enum UserSortType { name, age }

final List<UserInfo> _userInfos = <UserInfo>[
  UserInfo(name: '来之', age: 18),
  UserInfo(name: 'bill', age: 49),
  UserInfo(name: '李雷', age: 26),
  UserInfo(name: '鸿蒙', age: 19),
];

@riverpod
class UserSort extends _$UserSort {
  @override
  UserSortType build() {
    return UserSortType.name;
  }

  void sort(UserSortType sortType) {
    state = sortType;
  }
}

@riverpod
class FetchUserInfos extends _$FetchUserInfos {
  @override
  FutureOr<List<UserInfo>> build() async {
    await Future.delayed(const Duration(seconds: 2));
    final sortType = ref.watch(userSortProvider);
    print('[debug] FetchUserInfos: sorttype:$sortType');
    final userInfos = ref.watch(userInfoProviderProvider);
    List<UserInfo> sortedList = List.from(userInfos);

    switch (sortType) {
      case UserSortType.name:
        sortedList.sort((a, b) => a.name.compareTo(b.name));
        break;
      case UserSortType.age:
        sortedList.sort(
          (a, b) => a.age.compareTo(b.age),
        );
        break;
    }
    state = AsyncValue.data(sortedList); // 保存排序后的列表到状态
    return sortedList;
  }

// 修改 updateSortedUserInfo 方法
  void updateSortedUserInfo(int index, {String? name, int? age}) {
    final asyncValue = state;
    final sortedList = asyncValue.value ?? [];
    if (sortedList.isEmpty) return;

    final userInfo = sortedList[index];
    final updatedUserInfo = UserInfo(
      name: name ?? userInfo.name,
      age: age ?? userInfo.age,
    );
    sortedList[index] = updatedUserInfo;

    // 更新原始列表
    final userInfos = ref.read(userInfoProviderProvider.notifier).state;
    final originalIndex = userInfos
        .indexWhere((u) => u.name == userInfo.name && u.age == userInfo.age);
    if (originalIndex != -1) {
      userInfos[originalIndex] = updatedUserInfo;
    }

    state = AsyncValue.data(List.from(sortedList)); // 触发重建
  }
}

@riverpod
class UserInfoProvider extends _$UserInfoProvider {
  @override
  List<UserInfo> build() {
    return _userInfos;
  }

  void updateUserInfo(int idx, {String? name, int? age}) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == idx)
          state[i] =
              UserInfo(name: name ?? state[i].name, age: age ?? state[i].age)
        else
          state[i],
    ];
  }
}


class AuthRepository {
 
  Future<void> signInAnonymously() async {
     
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}


@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> signInAnonymously() async {
    // 7. read the repository using ref
    final authRepository = ref.read(authRepositoryProvider);
    // 8. set the loading state
    state = const AsyncLoading();
    // 9. sign in and update the state (data or error)
    state = await AsyncValue.guard(authRepository.signInAnonymously);
  }
}
