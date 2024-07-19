import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_demo/test/demo/life_cycle_provider.dart';

class LifeCycleProviderPage extends ConsumerWidget {
  const LifeCycleProviderPage({required this.postId, super.key});
  final String postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textP = ref.watch(fetchPostControllerProvider(postId: postId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('life cycle'),
      ),
      body: Column(
        children: [
          textP.when(
              data: (value) => Text(value),
              error: (err, statck) => Container(color: Colors.red),
              loading: () => const CircularProgressIndicator(
                    color: Colors.green,
                  ))
        ],
      ),
    );
  }
}
