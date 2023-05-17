import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieApi {
  static const apiKey = 'e8bf0a88d8c448b3069dca27bd1d7619'; // Replace with your TMDB API key

  static Future<List<Movie>> fetchMovies({int page = 1}) async {
    final url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&page=$page';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];

      List<Movie> movies = [];
      for (var movieData in results) {
        final movieId = movieData['id'];
        final movie = Movie(
          title: movieData['title'] ?? 'Unknown',
          year: movieData['release_date'] ?? 'Unknown',
          rating: movieData['vote_average']?.toDouble() ?? 0.0,
          imageUrl: 'https://image.tmdb.org/t/p/w500${movieData['poster_path']}' ?? '',
          movieId: movieId,
        );
        movies.add(movie);
      }

      return movies;
    } else {
      throw Exception('Failed to fetch movies.');
    }
  }
}
