import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_api_app/core/const.dart';
import 'package:movie_api_app/models/tv.dart';
import 'package:movie_api_app/widget/tv_details_title.dart';

class TvDetailedScreen extends StatelessWidget {
  const TvDetailedScreen({super.key, required this.tv});

  final TV tv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            expandedHeight: 500,
            pinned: true,
            floating: true,
            backgroundColor: AppColors.background,

            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textColor),
              onPressed: () => context.go('/home'),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.hintColor, // Black background
                shape: const CircleBorder(), // Circular shape
                padding: const EdgeInsets.all(10), //
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '${ApiConst.imagePath}${tv.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // Title Text
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      tv.originalName, // Display the tv title
                      style: GoogleFonts.aBeeZee(
                        color: AppColors.textColor, // Text color
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline, // Underline text
                        decorationColor:
                            AppColors
                                .textColor, // Change this to any color you want
                        decorationThickness: 2, // Adjust thickness of underline
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Overview',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    tv.overview,
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        TVInfoCard(
                          icon: Icons.calendar_month,
                          label: 'First Air Date :',
                          value: '${tv.firstAirDate}',
                          iconColor: AppColors.textColor,
                        ),
                        SizedBox(height: 10),
                        TVInfoCard(
                          icon: Icons.star,
                          label: 'Rating :',
                          value: '${tv.voteAverage.toStringAsFixed(1)}/10',
                          iconColor: Colors.amber,
                        ),
                        SizedBox(height: 10),
                        TVInfoCard(
                          icon: Icons.trending_up,
                          label: 'Popularity :',
                          value: '${tv.popularity}',
                          iconColor: Colors.blue,
                        ),
                        SizedBox(height: 10),
                        TVInfoCard(
                          icon: Icons.category,
                          label: 'Category adult/general :',
                          value: '${tv.adult ? 'Adult' : 'General'}',
                          iconColor: AppColors.textColor,
                        ),
                        SizedBox(height: 10),
                        TVInfoCard(
                          icon: Icons.language,
                          label: 'Language :',
                          value: '${tv.originalLanguage}',
                          iconColor: AppColors.textColor,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
