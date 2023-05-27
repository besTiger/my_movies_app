import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/actors_list_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/background_image_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/blurred_overlay_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/buttons_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/details_movie_AppBar_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/movie_image_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/movie_overview_widget.dart';
import 'package:my_movies_app/screens/details_movie_screen/widgets/rating_stars_widget.dart';
import '../../models/actors.dart';

class DetailsMovieScreen extends StatefulWidget {
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
  DetailsMovieScreenState createState() => DetailsMovieScreenState();
}

class DetailsMovieScreenState extends State<DetailsMovieScreen> {
  late Timer _timer;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MovieAppBar(
        title: widget.movieTitle,
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(imageUrl: widget.movieImageUrl),
            Positioned.fill(
              child: _isLoading
                  ? const Center(
                    child: CircularProgressIndicator(
                     valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              )
                  : Stack(
                   children: [
                    const BlurredOverlay(),
                    MovieImage(imageUrl: widget.movieImageUrl),
                    Positioned(
                     top: 350,
                     left: 22,
                     child: RatingStars(
                      rating: widget.movieRating,
                      starSize: 35,
                      starColor: Colors.orange,
                      unratedStarColor: Colors.grey,
                    ),
                  ),
                    const FavoriteButton(),
                    const ShareButton(),
                    const PlayButton(),
                    ActorsList(actors: widget.actors),
                    MovieOverview(movieOverview: widget.movieOverview),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



