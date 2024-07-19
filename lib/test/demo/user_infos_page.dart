
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfosPage extends ConsumerWidget {
  const UserInfosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container();
    // final userInfosProvider = ref.watch(fetchUserInfosProvider);

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('future code'),
    //     actions: [
    //       DropdownButton<UserSortType>(
    //         value: ref.watch(userSortProvider),
    //         items: UserSortType.values.map((UserSortType sortType) {
    //           return DropdownMenuItem<UserSortType>(
    //             value: sortType,
    //             child: Text(sortType == UserSortType.name
    //                 ? 'Sort by Name'
    //                 : 'Sort by Age'),
    //           );
    //         }).toList(),
    //         onChanged: (UserSortType? newValue) {
    //           if (newValue != null) {
    //             ref.read(userSortProvider.notifier).sort(newValue);
    //           }
    //         },
    //       ),
    //       MaterialButton(
    //         onPressed: () {
    //           // ref.read(userInfoProviderProvider.notifier).updateUserInfo(0, name: 'name', age: 100);
    //           ref
    //               .read(fetchUserInfosProvider.notifier)
    //               .updateSortedUserInfo(0, name: 'name', age: 100);
    //         },
    //         child: const Text('change user info'),
    //       )
    //     ],
    //   ),
    //   body: Column(
    //     children: [
    //       userInfosProvider.when(
    //           data: (userInfos) => ListView.builder(
    //                 shrinkWrap: true,
    //                 itemCount: userInfosProvider.value?.length ?? 0,
    //                 itemBuilder: (context, index) {
    //                   final userInfo = userInfosProvider.value![index];
    //                   return ListTile(
    //                     title: Text(userInfo.name),
    //                     subtitle: Text('${userInfo.age}'),
    //                   );
    //                 },
    //               ),
    //           error: (err, statck) => Text('err:$err'),
    //           loading: () => const Center(
    //                 child: CircularProgressIndicator(
    //                   color: Colors.lightGreen,
    //                 ),
    //               ))
    //     ],
    //   ),
    // );
  }
}
