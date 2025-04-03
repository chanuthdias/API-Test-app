import 'package:flutter/material.dart';
import 'package:movie_api_app/core/const.dart';
import 'package:movie_api_app/models/people.dart';

class PeopleSlider extends StatelessWidget {
  const PeopleSlider({super.key, required this.peopleStream});

  final Stream<List<People>> peopleStream;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, // Adjusted height to fit circular images
      width: double.infinity,
      child: StreamBuilder<List<People>>(
        stream: peopleStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No people available.'));
          }

          final peopleList = snapshot.data!;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: peopleList.length,
            itemBuilder: (context, index) {
              final person = peopleList[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ClipOval(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          '${ApiConst.imagePath}${person.profilePath}',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 100,
                      child: Text(
                        person.name,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
