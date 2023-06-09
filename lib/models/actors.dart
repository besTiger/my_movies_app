class Actors {
  final String name;
  final String character;
  final String profileUrl;

  Actors({
    required this.name,
    required this.character,
    required this.profileUrl,
  });

  factory Actors.fromJson(Map<String, dynamic> json) {
    return Actors(
      name: json['name'] ?? '',
      character: json['character'] ?? '',
      profileUrl: 'https://image.tmdb.org/t/p/w500${json['profile_path']}' ?? '',
    );
  }
}

