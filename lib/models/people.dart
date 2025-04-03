class People {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String?
  profilePath; // Nullable, as some people might not have a profile picture

  // Constructor
  People({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });

  // Factory constructor from JSON
  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      adult: json["adult"] ?? false,
      gender: json["gender"] ?? 0,
      id: json["id"] ?? 0,
      knownForDepartment: json["known_for_department"] ?? "Unknown",
      name: json["name"] ?? "Unknown",
      originalName: json["original_name"] ?? "Unknown",
      popularity: (json["popularity"] ?? 0.0).toDouble(),
      profilePath: json["profile_path"],
    );
  }
}
