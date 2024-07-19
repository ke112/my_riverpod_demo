import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_string_provider.g.dart';

@riverpod
class NewStringLabel extends _$NewStringLabel {
  @override
  String build() {
    return 'dbestech';
  }

  void toCamelCase() {
    state = '${state[0].toUpperCase()}${state.substring(1).toLowerCase()}';
    print(state);
  }
}

@JsonSerializable()
class Task {
  String taskId;
  String name;

  Task({required this.taskId, required this.name});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@riverpod
class TodosNotifier extends _$TodosNotifier {
  @override
  List<Task> build() {
    return [];
  }

  void refresh() async {
    Future.delayed(const Duration(seconds: 2));
    final data = [{'taskId': '1', 'name': 'task1'}, {'taskId': '2', 'name': 'task2'}];
    print('fresh:$data');
    state = data.map((e) => Task.fromJson(e)).toList();
  }
}


 