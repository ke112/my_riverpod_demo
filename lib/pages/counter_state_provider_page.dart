import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_demo/viewModel/counter_state_provider.dart';

class CounterStateProviderPage extends ConsumerWidget {
  const CounterStateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleText = ref.watch(titleProvider);
    debugPrint('${12122222222}');
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Text(titleText, style: const TextStyle(color: Colors.white, fontSize: 30)),
          ),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              final counter = ref.watch(counterProvider);
              return Text(
                '$counter',
                style: const TextStyle(color: Colors.white, height: 5, fontSize: 23),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('(+1)'),
                  onPressed: () {
                    ref.read(counterProvider.notifier).state++;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.remove),
                  label: const Text('(-1)'),
                  onPressed: () => ref.read(counterProvider.notifier).state--,
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.replay),
            label: const Text('重制'),
            onPressed: () => ref.read(counterProvider.notifier).state = 0,
          ),
        ],
      ),
    );
  }
}
