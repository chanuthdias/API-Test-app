class TV {
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  String firstAirDate;
  double voteAverage;
  int voteCount;

  TV({
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TV.fromJson(Map<String, dynamic> json) {
    return TV(
      adult: json["adult"] ?? false,
      backdropPath: json["backdrop_path"] ?? "",
      originalLanguage: json["original_language"] ?? "",
      originalName: json["original_name"] ?? "",
      overview: json["overview"] ?? "",
      popularity: (json["popularity"] ?? 0.0).toDouble(),
      posterPath: json["poster_path"] ?? "",
      firstAirDate: json["first_air_date"] ?? "",
      voteAverage: (json["vote_average"] ?? 0.0).toDouble(),
      voteCount: json["vote_count"] ?? 0,
    );
  }
}
