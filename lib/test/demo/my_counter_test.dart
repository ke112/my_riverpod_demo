import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_counter_test.g.dart';

//StateProvider vs NotifierProvider
final counterProvider = StateProvider<int>((ref) {
  return 1;
});

//----------------------------
class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

final clsCounterProvider = NotifierProvider<CounterNotifier, int>(CounterNotifier.new);
//----------------------------

//代码自动生成
@riverpod
class GCounter extends _$GCounter {
  @override
  int build() {
    return 10;
  }

  void increment() {
    state++;
  }
}

class UserInfo {}

class Repository {
  final Stream<UserInfo?> currentUser = const Stream<UserInfo>.empty();
}

@riverpod
class MyCounterStream extends _$MyCounterStream {
  @override
  Stream<int> build() {
    return Stream.value(1);
  }

  void increment() {
    state = AsyncValue.data(state.value! + 1);
  }
}

class MyCounterTest extends ConsumerWidget {
  const MyCounterTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final counter = ref.read(counterProvider);
    final clsCounter = ref.read(clsCounterProvider);
    final autoGCounter = ref.read(gCounterProvider);
    final streamP = ref.read(myCounterStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('xxx'),
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, WidgetRef ref, _) {
              debugPrint('${22222222222}');
              return MaterialButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state++;
                },
                child: Text('counter is:${ref.watch(counterProvider)}'),
              );
            },
          ),
          Builder(builder: (context) {
            debugPrint('${1111111111111}');
            return TextButton(
              onPressed: () => ref.read(clsCounterProvider.notifier).increment(),
              child: Text('cls counter is:$clsCounter'),
            );
          }),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return MaterialButton(
                onPressed: () => ref.read(gCounterProvider.notifier).increment(),
                child: Text('auto gen counter is:$autoGCounter'),
              );
            },
          ),
          MaterialButton(
            onPressed: () => ref.read(myCounterStreamProvider.notifier).increment(),
            child: streamP.when(
                data: (value) => Text('stream value:$value'),
                error: (err, stack) => Text('stream err:$err'),
                loading: () => const CircularProgressIndicator(
                      color: Colors.blue,
                    )),
          ),
        ],
      ),
    );
  }
}
