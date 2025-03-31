class Movie {
  String title;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;
  bool adult;
  String backdropPath;
  String originalLanguage;
  double popularity;
  bool video;
  int voteCount;

  // Constructor
  Movie({
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.popularity,
    required this.video,
    required this.voteCount,
  });

  // Factory constructor from JSON
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"] ?? "",
      originalTitle: json["original_title"] ?? "",
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      releaseDate: json["release_date"] ?? "",
      voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
      adult: json["adult"] ?? false,
      backdropPath: json["backdrop_path"] ?? "",
      originalLanguage: json["original_language"] ?? "",
      popularity: json["popularity"]?.toDouble() ?? 0.0,
      video: json["video"] ?? false,
      voteCount: json["vote_count"]?.toInt() ?? 0,
    );
  }
}
