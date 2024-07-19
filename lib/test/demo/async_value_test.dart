import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_value_test.g.dart';

class MyData {
  static fromJson(dynamic obj) {}
}

@riverpod
class MyNotifier extends _$MyNotifier {
  @override
  FutureOr<MyData> build() {
    return Future.value(MyData());
  }

  Future<void> sideEffect() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final reponse = await Dio().get('my_api/data');
      return MyData.fromJson(reponse);
    });
  }
}

class Weather {
  final String name;

  Weather(this.name);
}

abstract class WeatherRepository {
  Future<Weather> getWeather({required String city});
}

// class HttpWeatherRepository implements WeatherRepository {
//   HttpWeatherRepository({required this.api, required this.client});
//   // custom class defining all the API details
//   final OpenWeatherMapAPI api;
//   // client for making calls to the API
//   final http.Client client;

//   // implements the method in the abstract class
//   Future<Weather> getWeather({required String city}) {
//     // TODO: send request, parse response, return Weather object or throw error
//   }
// }
class HttpWeatherRepository implements WeatherRepository {
  // custom class defining all the API details
  final String api;
  // client for making calls to the API
  final String client;

  HttpWeatherRepository(this.api, this.client);

  @override
  Future<Weather> getWeather({required String city}) {
    return Future.value(Weather('bj'));
  }
}

// @riverpod
// class weatherRepository extends _$weatherRepository {
//   @override
//   HttpWeatherRepository build() {
//     return HttpWeatherRepository(api: OpenWeatherMapAPI(), client: http.Client());;
//   }
// }

// @riverpod
// final weatherRepositoryProvider = Provider<HttpWeatherRepository>((ref) {
//   return HttpWeatherRepository('api', 'client');
// });
@riverpod
WeatherRepository weatherRepository(WeatherRepositoryRef ref) {
  return HttpWeatherRepository('api', 'client');
}

// this will generate a fetchWeatherProvider
@riverpod
Future<Weather> fetchWeather(FetchWeatherRef ref, String city) {
  return ref.watch(weatherRepositoryProvider).getWeather(city: city);
}

//page
class AsyncValueTestPage extends ConsumerWidget {
  const AsyncValueTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(weatherRepositoryProvider);

    return Column(
      children: [
        Container(
          child: MaterialButton(
            onPressed: () => repository.getWeather(city: 'lodon'),
            child: const Text('load: strream'),
          ),
        )
      ],
    );
  }
}
