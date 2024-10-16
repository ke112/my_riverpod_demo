import 'package:flutter_riverpod/flutter_riverpod.dart';

Duration duration = const Duration();

final timerProvider = StreamProvider.autoDispose(
  (ref) => Stream.periodic(
      const Duration(
        seconds: 1,
      ),
      (_) => addTimer(ref)),
);

final addSeconds = StateProvider<int>((ref) => 1);

void addTimer(ref) {
  final seconds = ref.watch(addSeconds.notifier).state + duration.inSeconds;
  duration = Duration(seconds: seconds);
}
