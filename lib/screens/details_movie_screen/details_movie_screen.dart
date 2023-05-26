import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/rating_stars_widget.dart';
import '../../models/actors.dart';

class DetailsMovieScreen extends StatelessWidget {
  final String movieTitle;
  final String movieImageUrl;
  final String movieOverview;
  final double movieRating;
  final List<Actors> actors;

  const DetailsMovieScreen({
    Key? key,
    required this.movieTitle,
    required this.movieImageUrl,
    required this.movieOverview,
    required this.movieRating,
    required this.actors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          movieTitle,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          iconSize: 30,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Background image with blur effect
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                movieImageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // Blurred overlay
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
            // Movie image
            Positioned(
              top: 8,
              left: 8,
              right: 150,
              bottom: 410,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: ClipRRect(
                  child: Image.network(
                    movieImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 350,
              left: 22,
              child: RatingStars(
                rating: movieRating,
                starSize: 35,
                starColor: Colors.orange,
                unratedStarColor: Colors.grey,
              ),
            ),
            Positioned(
              top: 70,
              right: 22,
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: IconButton(
                  onPressed: () {
                    // Handle favorite button pressed
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                  color: Colors.orange,
                  iconSize: 40,
                ),
              ),
            ),
            Positioned(
              top: 160,
              right: 22,
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: IconButton(
                  onPressed: () {
                    // Handle share button pressed
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                  color: Colors.orange,
                  iconSize: 40,
                ),
              ),
            ),
            Positioned(
              top: 250,
              right: 22,
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: IconButton(
                  onPressed: () {
                    // Handle play button pressed
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  color: Colors.orange,
                  iconSize: 40,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: actors.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: Colors.black, width: 2.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              radius: 36,
                              backgroundImage: NetworkImage(
                                actors[index].profileUrl,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0), // Add horizontal padding
                            child: SizedBox(
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0), // Add inner padding
                                child: Text(
                                  actors[index].name,
                                  style: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),


            Positioned(
              top: 380,
              left: 8,
              right: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange[200],
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    movieOverview,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
