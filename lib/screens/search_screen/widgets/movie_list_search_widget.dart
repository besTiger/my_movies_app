import 'package:flutter/material.dart';
import '../../../models/movies.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    required this.searchResults,
    required this.onTapMovie,
  }) : super(key: key);

  final List<Movie> searchResults;
  final ValueChanged<Movie> onTapMovie;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: searchResults.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: Colors.grey,
      ),
      itemBuilder: (context, index) {
        final movie = searchResults[index];
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.network(
              'https://image.tmdb.org/t/p/w200${movie.imageUrl}',
              fit: BoxFit.contain,
            ),
            title: Text(
              movie.title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Year: ${movie.year}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Rating: ${movie.rating.toStringAsFixed(1)}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            onTap: () => onTapMovie(movie),
          ),
        );
      },
    );
  }
}
