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
  List<Actors> actors;

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
    final List<Actors> actorsList = [];
    if (json['actors'] != null && json['actors'] is List) {
      final List<dynamic> actorsData = json['actors'];
      actorsList.addAll(actorsData.map((actorData) => Actors.fromJson(actorData)));
    }

    return Movie(
      title: json['title'] ?? '',
      year: json['release_date'] ?? '',
      rating: json['vote_average']?.toDouble() ?? 0.0,
      imageUrl: 'https://image.tmdb.org/t/p/w500${json['poster_path']}' ?? '',
      movieId: json['id'] ?? 0,
      releaseDate: json['release_date'] ?? '',
      genre: '',
      overview: json['overview'] ?? '',
      actors: actorsList,
    );
  }
}
