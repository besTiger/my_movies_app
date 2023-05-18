class Movie {
  final String title;
  final String year;
  final double rating;
  final String imageUrl;
  final int movieId;

  Movie({
    required this.title,
    required this.year,
    required this.rating,
    required this.imageUrl,
    required this.movieId,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      year: json['year'] ?? '',
      rating: json['rating']?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] ?? '',
      movieId: json['movieId'] ?? 0,
    );
  }
}
