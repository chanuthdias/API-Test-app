import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_api_app/core/const.dart';
import 'package:movie_api_app/models/movie.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({super.key, required this.snapshot});

  final AsyncSnapshot<List<Movie>> snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data?.length ?? 0,
        itemBuilder: (context, index) {
          final movie = snapshot.data![index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                context.pushNamed('details', extra: movie);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  // size of the box in the top rated and upcoming
                  height: 300,
                  width: 150,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${ApiConst.imagePath}${movie.posterPath}',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
