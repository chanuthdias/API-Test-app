class TV {
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  String firstAirDate;
  String name;
  double voteAverage;
  int voteCount;

  // Constructor
  TV({
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  // Factory constructor from JSON
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
      name: json["name"] ?? "",
      voteAverage: (json["vote_average"] ?? 0.0).toDouble(),
      voteCount: json["vote_count"] ?? 0,
    );
  }
}
