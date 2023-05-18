import 'package:flutter/material.dart';
import 'package:my_movies_app/screens/movies_screen/tabs_movies_screen/popular_tab/widgets/rounded_image_widget.dart';
import '../../../../../models/movies.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          color: Colors.orange[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedImage(imageUrl: movie.imageUrl ?? ''),
              const SizedBox(height: 4.0),
              Text(
                movie.year?.toString() ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Rating: ${movie.rating?.toStringAsFixed(1) ?? ''}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
