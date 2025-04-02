import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_api_app/core/const.dart';
import 'package:movie_api_app/models/movie.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({super.key, required this.movieStream});

  final Stream<List<Movie>> movieStream; // Stream of movies

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: StreamBuilder<List<Movie>>(
        stream: movieStream,
        builder: (context, snapshot) {
          // Handle loading and error states
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No trending movies available.'));
          }

          final movies = snapshot.data!; // Extract movies list

          return CarouselSlider.builder(
            itemCount: movies.length,
            options: CarouselOptions(
              height: 330,
              autoPlay: true,
              viewportFraction: 0.55,
              enlargeCenterPage: true,
              pageSnapping: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(seconds: 1),
            ),
            itemBuilder: (context, itemIndex, pageViewIndex) {
              final movie = movies[itemIndex];

              return GestureDetector(
                onTap: () {
                  context.go('/details', extra: movie);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 300,
                    width: 200,
                    child: Image.network(
                      '${ApiConst.imagePath}${movie.posterPath}',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      cacheWidth: 300, // Improve performance
                      cacheHeight: 450, // Improve performance
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
