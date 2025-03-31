import 'package:flutter/material.dart';
import 'package:movie_api_app/core/service_locator.dart';
import 'package:movie_api_app/router/router.dart';

void main() {
  setupLocator(); // Initialize dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter, // Use GoRouter
    );
  }
}
