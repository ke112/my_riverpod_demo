import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_demo/test/demo/my_string_provider.dart';

class TestPage extends ConsumerStatefulWidget {
  const TestPage({super.key});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends ConsumerState<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = ref.watch(todosNotifierProvider);
    final r = ref.read(todosNotifierProvider.notifier);
    return Container();
  }
}
