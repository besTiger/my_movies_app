import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../model/movie.dart';
import '../../../services/movie_api.dart';
import '../widgets/movie_item_widget.dart';

class PopularTab extends StatefulWidget {
  const PopularTab({Key? key}) : super(key: key);

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
            return MovieItem(movie: movie);
          },
        ),
      ),
    );
  }
}
