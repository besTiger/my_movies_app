import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../model/movie.dart';
import '../../../services/movie_api.dart';

class PopularTab extends StatefulWidget {
  const PopularTab({super.key});

  @override
  PopularTabState createState() => PopularTabState();
}

class PopularTabState extends State<PopularTab> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    try {
      final movies = await MovieApi.fetchMovies();
      setState(() {
        this.movies = movies;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch movies: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(4.0),
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          ),
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      movie.imageUrl,
                      width: 150.0,
                      height: 210.0,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 4.0),
                  Text(
                    movie.year,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Rating: ${movie.rating}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}