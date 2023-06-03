import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_movies_app/screens/search_screen/widgets/movie_list_search_widget.dart';
import 'package:my_movies_app/services/movie_search_service.dart';
import '../../models/movies.dart';
import 'dart:async';
import 'package:my_movies_app/screens/search_screen/widgets/search_bar_widget.dart';
import '../details_movie_screen/details_movie_screen.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  List<Movie> searchResults = [];
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  List<String> genres = [
    'Action',
    'Drama',
    'Comedy',
    'Thriller',
    'Romance',
    'Adventure',
  ];
  String selectedGenre = '';
  Timer? _debounceTimer;
  FocusNode searchFocusNode = FocusNode();

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> searchMovies(String query) async {
    setState(() {
      isLoading = true;
    });

    try {
      final movies = await MovieSearchService.searchMovies(query);
      setState(() {
        searchResults = movies;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Failed to search movies: $e');
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> searchMoviesByGenre(String genre) async {
    setState(() {
      isLoading = true;
    });

    try {
      final movies = await MovieSearchService.searchMoviesByCategory(genre);
      setState(() {
        searchResults = movies;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Failed to search movies by genre: $e');
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          searchFocusNode.unfocus();
        },
        child: Column(
          children: [
            SearchBarTest(
              searchController: searchController,
              debounceTimer: _debounceTimer,
              onSearchTextChanged: (value) {
                if (_debounceTimer != null) {
                  _debounceTimer!.cancel();
                }
                _debounceTimer = Timer(const Duration(milliseconds: 500), () {
                  searchMovies(value);
                  searchFocusNode.unfocus();
                });
              },
              onClearSearch: () {
                searchController.clear();
                setState(() {
                  searchResults.clear();
                });
              },
              genres: genres,
              selectedGenre: selectedGenre,
              onGenreSelected: (genre) {
                setState(() {
                  selectedGenre = genre;
                });
                searchMoviesByGenre(genre);
              },
            ),
            Expanded(
              child: isLoading
                  ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black), // Set the color to black
                ),
              )
                  : MovieList(
                searchResults: searchResults,
                onTapMovie: (movie) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsMovieScreen(
                        movieTitle: movie.title,
                        movieImageUrl: movie.imageUrl,
                        movieOverview: movie.overview,
                        movieRating: movie.rating,
                        actors: movie.actors,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}






