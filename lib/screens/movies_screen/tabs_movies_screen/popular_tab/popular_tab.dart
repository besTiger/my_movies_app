import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_movies_app/screens/movies_screen/tabs_movies_screen/popular_tab/widgets/backToTop_widget.dart';
import 'package:my_movies_app/screens/movies_screen/tabs_movies_screen/popular_tab/widgets/movie_gridview_widget.dart';
import '../../../../models/movies.dart';
import '../../../../services/movie_api.dart';
import '../../../details_movie_screen/details_movie_screen.dart';
import 'widgets/movie_item_widget.dart';


class PopularTab extends StatefulWidget {
  const PopularTab({Key? key}) : super(key: key);

  @override
  PopularTabState createState() => PopularTabState();
}

class PopularTabState extends State<PopularTab>  {
  List<Movie> movies = [];
  int currentPage = 1;
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;
  late AnimationController _animationController;

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
    _animationController.dispose();
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
        movies.addAll(newMovies.cast<Movie>());
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
    await Future.delayed(const Duration(milliseconds: 1000));
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
            builder: (context) => MovieDetailScreen(),
          ),
        );
      },
      child: MovieItem(movie: movie),
    );
  }


  Widget _buildLoadingSpinner() {
    return isLoading && movies.isNotEmpty
        ? const Align(
         alignment: Alignment.bottomCenter,
          child: Padding(
           padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    )
        : const SizedBox.shrink();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: Colors.black,
          onRefresh: _refreshMovies,
          child: Stack(
            children: [
              MovieGridView(
                scrollController: _scrollController,
                movies: movies,
                buildMovieItem: _buildMovieItem,
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: AnimatedOpacity(
                  opacity: _showBackToTopButton ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: BackToTopButton(
                    scrollController: _scrollController,
                  ),
                ),
              ),
              _buildLoadingSpinner(),
            ],
          ),
        ),
      ),
    );
  }
}