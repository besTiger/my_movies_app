import 'description.dart';

class Movie {
  final String title;
  final String year;
  final double rating;
  final String imageUrl;
  final Description description;
  final int movieId;



  Movie({
    required this.title,
    required this.year,
    required this.rating,
    required this.imageUrl,
    required this.description,
    required this.movieId,
  });
}
