import 'package:go_router/go_router.dart';
import 'package:movie_api_app/UI/screens/auth/login_screen.dart';
import 'package:movie_api_app/UI/screens/auth/signup_screen.dart';
import 'package:movie_api_app/UI/screens/home/home_screen.dart';
import 'package:movie_api_app/UI/screens/splash/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
);
