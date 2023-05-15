import 'dart:convert';
import '../model/movie.dart';
import 'package:http/http.dart' as http;

class MovieApi {
  static Future<List<Movie>> fetchMovies() async {
    const apiKey = 'e8bf0a88d8c448b3069dca27bd1d7619'; // Replace with your TMDB API key
    const url = 'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];

      return results
          .map<Movie>((movieData) => Movie(
        title: movieData['title'],
        year: movieData['release_date'],
        rating: movieData['vote_average'].toDouble(),
        imageUrl:
        'https://image.tmdb.org/t/p/w500${movieData['poster_path']}',
      ))
          .toList();
    } else {
      throw Exception('Failed to fetch movies.');
    }
  }
}
