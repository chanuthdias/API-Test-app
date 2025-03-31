import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_api_app/core/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        title: const Text('FLICKER PLAY'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                // controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search for movies...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                onChanged: (value) {
                  // Handle search logic here
                },
              ),

              const SizedBox(height: 32),

              Text('Trending Movies', style: GoogleFonts.aBeeZee(fontSize: 25)),

              const SizedBox(height: 32),

              SizedBox(
                child: MovieCard(
                  title: 'Inception',
                  rating: 8.8,
                  imageUrl: 'https://via.placeholder.com/150',
                ),
              ),

              const SizedBox(height: 32),

              Text(
                'Top Rated Movies',
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),

              const SizedBox(height: 32),

              SizedBox(
                child: MovieCard(
                  title: 'Inception',
                  rating: 8.8,
                  imageUrl: 'https://via.placeholder.com/150',
                ),
              ),

              const SizedBox(height: 32),

              Text('Upcoming Movies', style: GoogleFonts.aBeeZee(fontSize: 25)),

              const SizedBox(height: 32),

              SizedBox(
                child: MovieCard(
                  title: 'Inception',
                  rating: 8.8,
                  imageUrl: 'https://via.placeholder.com/150',
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

class MovieCard extends StatelessWidget {
  final String title;
  final double rating;
  final String imageUrl;

  const MovieCard({
    super.key,
    required this.title,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: TextStyle(fontSize: 16, color: AppColors.textColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
