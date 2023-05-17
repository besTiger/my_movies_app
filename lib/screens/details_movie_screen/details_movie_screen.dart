import 'package:flutter/material.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/actor_list_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/actors_title_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/movie_poster_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/movie_title_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/overview_text_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/overview_title_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/release_date_widget.dart';
import '../../models/details_movie.dart';
import '../../services/details_movies_api.dart';

class DetailsMovieScreen extends StatelessWidget {
  final int movieId;

  const DetailsMovieScreen(this.movieId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DetailsMovie>(
      future: DetailsMoviesApi.fetchMovieDetails(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Movie Description'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Movie Description'),
            ),
            body: const Center(
              child: Text('Failed to fetch movie details.'),
            ),
          );
        } else if (snapshot.hasData) {
          final movieDetails = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Movie Description'),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MoviePoster(imageUrl: movieDetails.posterUrl),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieTitle(title: movieDetails.title),
                        const SizedBox(height: 8),
                        ReleaseDate(date: movieDetails.releaseDate),
                        const SizedBox(height: 8),
                        const OverviewTitle(),
                        const SizedBox(height: 8),
                        OverviewText(overview: movieDetails.overview),
                        const SizedBox(height: 8),
                        const ActorsTitle(),
                        const SizedBox(height: 8),
                        ActorList(movieId: movieId),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Container(); // Default fallback if none of the conditions are met.
      },
    );
  }
}
