import 'package:flutter/material.dart';
import 'package:my_movies_app/screens/description_screen/widgets/actor_list_widget.dart';
import 'package:my_movies_app/screens/description_screen/widgets/actors_title_widget.dart';
import 'package:my_movies_app/screens/description_screen/widgets/movie_poster_widget.dart';
import 'package:my_movies_app/screens/description_screen/widgets/movie_title_widget.dart';
import 'package:my_movies_app/screens/description_screen/widgets/overview_text_widget.dart';
import 'package:my_movies_app/screens/description_screen/widgets/overview_title_widget.dart';
import 'package:my_movies_app/screens/description_screen/widgets/release_date_widget.dart';
import '../../models/description.dart';

class DescriptionScreen extends StatelessWidget {
  final Description description;
  final int movieId;

  const DescriptionScreen(
      {Key? key, required this.description, required this.movieId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Description'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviePoster(imageUrl: description.posterUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieTitle(title: description.title),
                  const SizedBox(height: 8),
                  ReleaseDate(date: description.releaseDate),
                  const SizedBox(height: 8),
                  const OverviewTitle(),
                  const SizedBox(height: 8),
                  OverviewText(overview: description.overview),
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
}
