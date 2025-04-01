// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_api_app/core/api.dart';
import 'package:movie_api_app/core/app_status.dart';
import 'package:movie_api_app/core/const.dart';
import 'package:movie_api_app/core/service_locator.dart';
import 'package:movie_api_app/models/movie.dart';
import 'package:movie_api_app/widget/movie_slider.dart';
import 'package:movie_api_app/widget/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;
  TextEditingController searchController = TextEditingController();

  late final Api _api;
  @override
  void initState() {
    super.initState();
    _api = GetIt.I<Api>(); // Use GetIt to fetch the registered API instance
    trendingMovies = _api.getTrendingMovies();
    topRatedMovies = _api.getTopRatedMovies();
    upcomingMovies = _api.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        title: const Text(
          'FLICKER PLAY',
          style: TextStyle(color: AppColors.textColor),
        ),
        //title: Image.asset('assets/Movie rating app logo.png'),
        centerTitle: true,
        actions: [
          IconButton(
            color: AppColors.textColor,
            icon: const Icon(Icons.logout),
            onPressed: () async {
              try {
                await getIt<AppStatus>().logout();
                context.go('/login');
              } catch (e) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Logout failed: $e')));
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                'Trending Movies',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return TrendingSlider(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Top Rated Movies',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return MoviesSlider(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Upcoming Movies',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return MoviesSlider(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
