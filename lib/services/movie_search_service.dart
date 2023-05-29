import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movies.dart';
import 'actors_api.dart';


class MovieSearchService {
  static const apiKey = 'e8bf0a88d8c448b3069dca27bd1d7619';

  static Future<List<Movie>> searchMovies(String query) async {
    final url = 'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];

      if (results != null && results is List<dynamic>) {
        List<Movie> movies = [];
        for (var movieData in results) {
          final movieId = movieData['id'];

          final actors = await ActorsApi.fetchActors(movieId: movieId);

          final movie = Movie.fromJson(movieData);
          movie.actors = actors;
          movies.add(movie);
        }

        return movies;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to search movies.');
    }
  }

  static Future<List<Movie>> searchMoviesByCategory(String category) async {
    final url = 'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=$category';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];

      if (results != null && results is List<dynamic>) {
        List<Movie> movies = [];
        for (var movieData in results) {
          final movieId = movieData['id'];

          final actors = await ActorsApi.fetchActors(movieId: movieId);

          final movie = Movie.fromJson(movieData);
          movie.actors = actors;
          movies.add(movie);
        }

        return movies;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to search movies by category.');
    }
  }
}
