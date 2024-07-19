import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_demo/viewModel/notifier_list_provider.dart';

class NotifierProviderPage extends ConsumerWidget {
  const NotifierProviderPage({required this.pageName, super.key});
  final String pageName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> randomStrList = ref.watch(randomStrNotifierProvider);
    final random = Random();

    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                ...randomStrList.map((string) => Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 10, top: 5),
                      height: 30,
                      width: 300,
                      color: Colors.brown,
                      child: Text(
                        string.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    ref.read(randomStrNotifierProvider.notifier).addString(
                        'This is the random String ${5 + random.nextInt(1000 + 1 - 5)}');
                  },
                  label: const Text('生成'),
                  icon: const Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.clear),
                  label: const Text('清除'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                  ),
                  onPressed: () {
                    //clear list function
                    ref
                        .read(randomStrNotifierProvider.notifier)
                        .removeStrings();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
