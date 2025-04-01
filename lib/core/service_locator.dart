import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movie_api_app/core/api.dart';
import 'package:movie_api_app/core/app_status.dart';
import 'package:movie_api_app/core/firebase_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<FirebaseService>(() => FirebaseService());
  getIt.registerLazySingleton<AppStatus>(() => AppStatus());

  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    ),
  );

  getIt.registerLazySingleton<Api>(() => Api());
}
