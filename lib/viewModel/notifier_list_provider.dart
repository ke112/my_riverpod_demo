import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier_list_provider.g.dart';

@riverpod
class RandomStrNotifier extends _$RandomStrNotifier {
  // randomStrNotifierProvider
  @override
  List<String> build() {
    return [];
  }

//using Dart's spread operator we create a new copy of the list
  void addString(String randomStr) {
    state = [...state, randomStr];
  }

  void removeStrings() {
    state = [];
  }
}  
 

 //watch  update ui
 //read  only read value