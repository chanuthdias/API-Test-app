import 'package:go_router/go_router.dart';
import 'package:movie_api_app/UI/detailed_screen.dart';
import 'package:movie_api_app/UI/screens/auth/login_screen.dart';
import 'package:movie_api_app/UI/screens/auth/signup_screen.dart';
import 'package:movie_api_app/UI/screens/home/home_screen.dart';
import 'package:movie_api_app/UI/screens/splash/splash_screen.dart';
import 'package:movie_api_app/models/movie.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/details',
      name: 'details',
      builder: (context, state) {
        final movie = state.extra as Movie; // Get movie from navigation
        return DetailsScreen(movie: movie);
      },
    ),
  ],
);
