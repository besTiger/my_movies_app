import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/description.dart';
import '../models/movie.dart';

const apiKey = 'e8bf0a88d8c448b3069dca27bd1d7619'; // Replace with your TMDB API key


class MovieApi {
  static Future<List<Actor>> fetchActors({required int movieId}) async {
    final url = 'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final castData = jsonData['cast'];

      return castData
          .map<Actor>((actorData) => Actor(
        name: actorData['name'],
        character: actorData['character'],
        profileUrl: 'https://image.tmdb.org/t/p/w500${actorData['profile_path']}',
      ))
          .toList();
    } else {
      throw Exception('Failed to fetch actors.');
    }
  }

  static Future<Description> fetchMovieDetails(int movieId) async {
    final url =
        'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&append_to_response=credits';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final actors = await fetchActors(movieId: movieId);

      final description = Description(
        title: jsonData['title'],
        releaseDate: jsonData['release_date'],
        overview: jsonData['overview'],
        posterUrl: 'https://image.tmdb.org/t/p/w500${jsonData['poster_path']}',
        actors: actors,
      );

      return description;
    } else {
      throw Exception('Failed to fetch movie details.');
    }
  }

  static Future<List<Movie>> fetchMovies() async {
    const url = 'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];

      List<Movie> movies = [];
      for (var movieData in results) {
        final movieId = movieData['id'];
        final description = await fetchMovieDetails(movieId);
        final movie = Movie(
          title: movieData['title'],
          year: movieData['release_date'],
          rating: movieData['vote_average'].toDouble(),
          imageUrl: 'https://image.tmdb.org/t/p/w500${movieData['poster_path']}',
          description: description,
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

