import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_api_app/core/const.dart';
import 'package:movie_api_app/models/tv.dart';

class TvSlider extends StatelessWidget {
  const TvSlider({super.key, required this.tvStream});

  final Stream<List<TV>> tvStream; // Accepts a Stream instead of AsyncSnapshot

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: StreamBuilder<List<TV>>(
        stream: tvStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No TV series available.'));
          }

          final tvList = snapshot.data!; // Extract tv list

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: tvList.length,
            itemBuilder: (context, index) {
              final tv = tvList[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    context.go('/tv_details', extra: tv);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: 400,
                      width: 150,
                      child: Image.network(
                        '${ApiConst.imagePath}${tv.posterPath}',
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
