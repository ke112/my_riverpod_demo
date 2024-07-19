import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_demo/viewModel/hello_world_provider.dart';

//方式一
class ProviderPage extends StatelessWidget {
  const ProviderPage({required this.pageName, super.key});

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pageName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final helloWorld = ref.read(helloWorldProvider);
                  return Text(helloWorld);
                },
              )
            ],
          ),
        ));
  }
}

//方式二
// class ProviderPage extends ConsumerWidget {
// const ProviderPage({required this.pageName, super.key});
// final String pageName;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
// final helloWorld = ref.watch(helloWorldProvider);
// final helloWorld = ref.watch(helloWorldProvider.select((value) => value));
// return Scaffold(
//     appBar: AppBar(
//       title: Text(pageName),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [Text(helloWorld)],
//       ),
//     ));
//   }
// }

//方式三
// class ProviderPage extends ConsumerStatefulWidget { 
//   const ProviderPage({required this.pageName, super.key});
//   final String pageName;

//   @override
//   _ProviderPageState createState() => _ProviderPageState();
// }

// class _ProviderPageState extends ConsumerState<ProviderPage> {
//   @override
//   Widget build(BuildContext context) {
//     final helloWorld = ref.watch(helloWorldProvider);
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.pageName),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [Text(helloWorld)],
//           ),
//         ));
//   }
// }



//关于性能
// class User {
//   final String name;
//   final int age;

//   User(this.name, this.age);
// }

// final userProvider = StateProvider((ref) => User('Alice', 25));

// //性能较差（对比下面）
// class UserWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final user = ref.watch(userProvider);
//     return Column(
//       children: [
//         Text('Name: ${user.name}'),
//         Text('Age: ${user.age}'),
//       ],
//     );
//   }
// }

// //最佳实践
// class UserNameWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userName = ref.watch(userProvider.select((user) => user.name));
//     return Text('Name: $userName');
//   }
// }

// class UserAgeWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userAge = ref.watch(userProvider.select((user) => user.age));
//     return Text('Age: $userAge');
//   }
// }