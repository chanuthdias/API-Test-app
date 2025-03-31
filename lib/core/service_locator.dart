import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movie_api_app/core/api.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  GetIt.I.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    ),
  );

  GetIt.I.registerLazySingleton<Api>(() => Api());
}
