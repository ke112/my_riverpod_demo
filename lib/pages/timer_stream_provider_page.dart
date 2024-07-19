import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_demo/viewModel/timer_stream_provider.dart';

class TimerStreamProviderPage extends ConsumerWidget {
  const TimerStreamProviderPage({required this.pageName, super.key});
  final String pageName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamCount = ref.watch(timerProvider);
    String twoDigits(
      int n,
    ) =>
        n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    String hours = twoDigits(duration.inHours);
    final backgroundColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          streamCount.when(
              data: (value) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 5)),
                  child: Text(
                    '$hours:$minutes:$seconds',
                    style: const TextStyle(color: Colors.white, fontSize: 40),
                  ),
                );
              },
              error: (err, stack) => Text(err.toString()),
              loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ))
        ],
      ),
    );
  }
}
