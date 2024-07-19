// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_string_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      taskId: json['taskId'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'taskId': instance.taskId,
      'name': instance.name,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newStringLabelHash() => r'6adcee900017b3428e356a1dbb0b15358409f921';

/// See also [NewStringLabel].
@ProviderFor(NewStringLabel)
final newStringLabelProvider =
    AutoDisposeNotifierProvider<NewStringLabel, String>.internal(
  NewStringLabel.new,
  name: r'newStringLabelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newStringLabelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewStringLabel = AutoDisposeNotifier<String>;
String _$todosNotifierHash() => r'63a79b426c4e83fdd65d7bf988aaa0af4444ab7a';

/// See also [TodosNotifier].
@ProviderFor(TodosNotifier)
final todosNotifierProvider =
    AutoDisposeNotifierProvider<TodosNotifier, List<Task>>.internal(
  TodosNotifier.new,
  name: r'todosNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todosNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodosNotifier = AutoDisposeNotifier<List<Task>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
