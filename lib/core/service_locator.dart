import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movie_api_app/core/api.dart';
import 'package:firebase_auth/firebase_auth.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register FirebaseAuth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Dio client
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

  // API service
  getIt.registerLazySingleton<Api>(() => Api());
}
