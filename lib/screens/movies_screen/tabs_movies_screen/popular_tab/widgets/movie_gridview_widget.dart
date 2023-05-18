import 'package:flutter/material.dart';
import '../../../../../models/movies.dart';

class MovieGridView extends StatelessWidget {
  const MovieGridView({
    Key? key,
    required this.scrollController,
    required this.movies,
    required this.buildMovieItem,
  }) : super(key: key);

  final ScrollController scrollController;
  final List<Movie> movies;
  final Widget Function(BuildContext, int) buildMovieItem;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(4.0),
      controller: scrollController,
      itemCount: movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
      ),
      itemBuilder: buildMovieItem,
    );
  }
}
