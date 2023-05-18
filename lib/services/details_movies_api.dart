import 'package:my_movies_app/models/details_movie.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailsMoviesApi {
  static const apiKey = 'e8bf0a88d8c448b3069dca27bd1d7619'; // Replace with your TMDB API key

  static Future<DetailsMovie> fetchMovieDetails(int movieId) async {
    final url = 'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&append_to_response=credits';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      final description = DetailsMovie(
        title: jsonData['title'],
        releaseDate: jsonData['release_date'],
        overview: jsonData['overview'],
        posterUrl: 'https://image.tmdb.org/t/p/w500${jsonData['poster_path']}',

      );

      return description;
    } else {
      throw Exception('Failed to fetch movie details.');
    }
  }

}