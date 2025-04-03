import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_api_app/core/const.dart';
import 'package:movie_api_app/models/movie.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({super.key, required this.movieStream});

  final Stream<List<Movie>>
  movieStream;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: StreamBuilder<List<Movie>>(
        stream: movieStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No movies available.'));
          }

          final movies = snapshot.data!; // Extract movies list

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    context.go('/movie_details', extra: movie);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: 400,
                      width: 150,
                      child: Image.network(
                        '${ApiConst.imagePath}${movie.posterPath}',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
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
