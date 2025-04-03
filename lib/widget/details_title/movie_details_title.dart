import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_api_app/core/const.dart';

class MovieInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;
  final Color textColor;
  final Color borderColor;

  const MovieInfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor = Colors.amber,
    this.textColor = AppColors.textColor,
    this.borderColor = AppColors.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          Text(
            ' $label ',
            style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
