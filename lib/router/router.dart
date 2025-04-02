import 'package:go_router/go_router.dart';
import 'package:movie_api_app/UI/tv_detailed_screen.dart';
import 'package:movie_api_app/core/app_status.dart';
import 'package:movie_api_app/core/service_locator.dart';
import 'package:movie_api_app/UI/movie_detailed_screen.dart';
import 'package:movie_api_app/UI/screens/auth/login_screen.dart';
import 'package:movie_api_app/UI/screens/auth/signup_screen.dart';
import 'package:movie_api_app/UI/screens/home/home_screen.dart';
import 'package:movie_api_app/UI/screens/splash/splash_screen.dart';
import 'package:movie_api_app/models/movie.dart';
import 'package:movie_api_app/models/tv.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final appStatus = getIt<AppStatus>();
    final isLoggedIn = appStatus.isLoggedIn;
    final location = state.uri.toString();

    // If on splash screen, wait for navigation
    if (location == '/') return null;

    // Redirect to login if not logged in and trying to access a protected route
    if (!isLoggedIn && location != '/login' && location != '/signup') {
      return '/login';
    }

    // Redirect logged-in users away from auth pages
    if (isLoggedIn && (location == '/login' || location == '/signup')) {
      return '/home';
    }

    return null;
  },
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
      path: '/movie_details',
      name: 'movie_details',
      builder: (context, state) {
        final movie = state.extra as Movie;
        return MovieDetailsScreen(movie: movie);
      },
    ),

    GoRoute(
      path: '/tv_details',
      name: 'tv_details',
      builder: (context, state) {
        final tv = state.extra as TV;
        return TvDetailedScreen(tv: tv);
      },
    ),
  ],
);
