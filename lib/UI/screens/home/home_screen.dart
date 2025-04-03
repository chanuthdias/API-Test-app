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
import 'package:movie_api_app/models/people.dart';
import 'package:movie_api_app/models/tv.dart';
import 'package:movie_api_app/widget/sliders/movie_slider.dart';
import 'package:movie_api_app/widget/sliders/movie_trending_slider.dart';
import 'package:movie_api_app/widget/sliders/people_slider.dart';
import 'package:movie_api_app/widget/sliders/tv_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> nowPlayingMovies;
  late Future<List<TV>> airingTodayTVShows;
  late Future<List<TV>> onAiringTVShows;
  late Future<List<TV>> popularTVShows;
  late Future<List<People>> popularPeople;

  TextEditingController searchController = TextEditingController();

  late final Api _api;
  @override
  void initState() {
    super.initState();
    _api = GetIt.I<Api>(); // Use GetIt to fetch the registered API instance
    trendingMovies = _api.getTrendingMovies();
    topRatedMovies = _api.getTopRatedMovies();
    upcomingMovies = _api.getUpcomingMovies();
    nowPlayingMovies = _api.getNowPlayingMovies();
    airingTodayTVShows = _api.getAiringTodayTV();
    onAiringTVShows = _api.getOnTheAirTV();
    popularTVShows = _api.getPopularTV();
    popularPeople = _api.getPopularPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        title: const Text(
          'API MOVIE APP',
          style: TextStyle(color: AppColors.textColor),
        ),
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
                'M O V I E S',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColors.textColor,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      AppColors.textColor,
                  decorationThickness: 2,
                ),
              ),
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
                child: FutureBuilder<List<Movie>>(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return MovieTrendingSlider(
                        movieStream: Stream.value(snapshot.data!),
                      );
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
                child: FutureBuilder<List<Movie>>(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return MoviesSlider(
                        movieStream: Stream.value(snapshot.data!),
                      );
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
                child: FutureBuilder<List<Movie>>(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return MoviesSlider(
                        movieStream: Stream.value(snapshot.data!),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Now Playing',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder<List<Movie>>(
                  future: nowPlayingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return MoviesSlider(
                        movieStream: Stream.value(snapshot.data!),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'T V - S E R I E S',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColors.textColor,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      AppColors.textColor,
                  decorationThickness: 2,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'TV shows - Airing Today',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder<List<TV>>(
                  future: airingTodayTVShows,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return TvSlider(tvStream: Stream.value(snapshot.data!));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'TV shows - On Airing',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder<List<TV>>(
                  future: onAiringTVShows,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return TvSlider(tvStream: Stream.value(snapshot.data!));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'TV shows - Popular',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder<List<TV>>(
                  future: popularTVShows,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return TvSlider(tvStream: Stream.value(snapshot.data!));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Popular actors and actresses',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder<List<People>>(
                  future: popularPeople,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      return PeopleSlider(
                        peopleStream: Stream.value(snapshot.data!),
                      );
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
