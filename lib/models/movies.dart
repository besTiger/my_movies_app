import 'actors.dart';

class Movie {
  final String title;
  final String year;
  final double rating;
  final String imageUrl;
  final int movieId;
  final String releaseDate;
  final String genre;
  final String overview;
  final List<Actors> actors;

  Movie({
    required this.title,
    required this.year,
    required this.rating,
    required this.imageUrl,
    required this.movieId,
    required this.releaseDate,
    required this.genre,
    required this.overview,
    required this.actors,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      year: json['year'] ?? '',
      rating: json['rating']?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] ?? '',
      movieId: json['movieId'] ?? 0,
      releaseDate: json['releaseDate'] ?? '',
      genre: json['genre'] ?? '',
      overview: json['overview'] ?? '',
      actors: (json['actors'] as List<dynamic>).map((actorJson) => Actors.fromJson(actorJson)).toList(),
    );
  }
}
