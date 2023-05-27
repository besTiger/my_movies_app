import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_movies_app/services/movie_search_service.dart';
import '../../models/movies.dart';
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

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search movies...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              searchController.clear();
              setState(() {
                searchResults.clear();
              });
            },
          ),
        ),
        onChanged: (value) {
          searchMovies(value);
        },
      ),
    );
  }

  Widget buildMovieItem(BuildContext context, int index) {
    final movie = searchResults[index];

    return Column(
      children: [
        ListTile(
          leading: Image.network(movie.imageUrl),
          title: Text(
            movie.title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('Year: ${movie.year} | Rating: ${movie.rating.toStringAsFixed(1)}'),
          onTap: () {
            navigateToDetailsScreen(context, movie);
          },
        ),
        const Divider(), // Separator line
      ],
    );
  }

  void navigateToDetailsScreen(BuildContext context, Movie movie) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            buildSearchBar(),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: buildMovieItem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
