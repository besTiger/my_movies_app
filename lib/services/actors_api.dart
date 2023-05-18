import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/actors.dart';

class ActorsApi {
  static const apiKey = 'e8bf0a88d8c448b3069dca27bd1d7619'; // Replace with your TMDB API key

  static Future<List<Actors>> fetchActors({required int movieId}) async {
    final url = 'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final castData = jsonData['cast'];

      return castData
          .map<Actors>((actorData) =>
          Actors(
            name: actorData['name'],
            character: actorData['character'],
            profileUrl: 'https://image.tmdb.org/t/p/w500${actorData['profile_path']}',
          ))
          .toList();
    } else {
      throw Exception('Failed to fetch actors.');
    }
  }
}