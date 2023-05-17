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

  @override
  void initState() {
    super.initState();
    _fetchMovies();

    _scrollController.addListener(() {
      if (!isLoading && _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchMovies();
      }
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

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (!isLoading && scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent) {
              _fetchMovies();
              return true;
            }
            return false;
          },
          child: GridView.builder(
            padding: const EdgeInsets.all(4.0),
            controller: _scrollController,
            itemCount: movies.length + (isLoading ? 1 : 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
            ),
            itemBuilder: (context, index) {
              if (index < movies.length) {
                return _buildMovieItem(context, index);
              } else {
                return _buildLoadingIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}