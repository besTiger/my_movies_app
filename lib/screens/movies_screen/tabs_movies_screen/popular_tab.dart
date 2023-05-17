import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../models/movie.dart';
import '../../../services/movie_api.dart';
import '../../details_movie_screen/details_movie_screen.dart';
import '../widgets/movie_item_widget.dart';

class PopularTab extends StatefulWidget {
  const PopularTab({Key? key}) : super(key: key);

  @override
  _PopularTabState createState() => _PopularTabState();
}

class _PopularTabState extends State<PopularTab> {
  List<Movie> movies = [];
  int currentPage = 1;
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollController.addListener(() {
      if (!isLoading &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        _fetchMovies();
      }

      setState(() {
        _showBackToTopButton = _scrollController.position.pixels > 100;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchMovies() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      await Future.delayed(const Duration(seconds: 1));

      final newMovies = await MovieApi.fetchMovies(page: currentPage);
      setState(() {
        movies.addAll(newMovies);
        currentPage++;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch movies: $e');
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _refreshMovies() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {
      movies.clear();
      currentPage = 1;
    });
    await _fetchMovies();
  }

  Widget _buildMovieItem(BuildContext context, int index) {
    final movie = movies[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsMovieScreen(movie.movieId),
          ),
        );
      },
      child: MovieItem(movie: movie),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: Colors.orange, // Set the color of the swipe-to-refresh indicator
          onRefresh: _refreshMovies,
          child: Stack(
            children: [
              GridView.builder(
                padding: const EdgeInsets.all(4.0),
                controller: _scrollController,
                itemCount: movies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) {
                  return _buildMovieItem(context, index);
                },
              ),
             // if (isLoading && movies.isEmpty) // Show progress bar only when loading the first page
               // Center(
                 // child: CircularProgressIndicator(
                   // valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  //),
               // ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: AnimatedOpacity(
                  opacity: _showBackToTopButton ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: FloatingActionButton(
                    onPressed: () {
                      _scrollController.animateTo(
                        0.0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    child: const Icon(Icons.arrow_upward),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

