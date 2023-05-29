import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_movies_app/services/movie_search_service.dart';
import '../../models/movies.dart';
import '../details_movie_screen/details_movie_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

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

  Widget buildSearchBar() {
    bool isTextFieldFocused = false;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black, width: 2.0),
        ),
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search movies...',
                labelStyle: TextStyle(
                  color: isTextFieldFocused ? Colors.red : Colors.black, // Change the label text color based on focus
                  fontSize: 18.0,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: isTextFieldFocused ? Colors.red : Colors.black, // Change the search icon color based on focus
                  size: 24.0,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: isTextFieldFocused ? Colors.red : Colors.black, // Change the clear icon color based on focus
                    size: 24.0,
                  ),
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      searchResults.clear();
                    });
                  },
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red, width: 2.0), // Customize the focused border color
                ),
              ),
              onChanged: (value) {
                setState(() {
                  isTextFieldFocused = true; // Update the focus state
                });
                searchMovies(value);
              },
              onTap: () {
                setState(() {
                  isTextFieldFocused = true; // Update the focus state
                });
              },
              onEditingComplete: () {
                setState(() {
                  isTextFieldFocused = false; // Update the focus state
                });
              },
              onSubmitted: (value) {
                setState(() {
                  isTextFieldFocused = false; // Update the focus state
                });
              },
            ),
            const SizedBox(height: 16.0),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16.0,
              runSpacing: 8.0,
              children: genres.map((genre) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  ),
                  child: Text(
                    genre,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedGenre = genre;
                    });
                    searchMoviesByGenre(genre);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildSearchBar(),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
            :ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final movie = searchResults[index];
                return ListTile(
                  leading: movie.imageUrl != null
                      ? Image.network(
                    'https://image.tmdb.org/t/p/w200${movie.imageUrl}',
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  )
                      : Container(), // Show an empty container if no poster path is available
                  title: Text(movie.title),
                  subtitle: Text(
                    'Year: ${movie.year} | Rating: ${movie.rating.toStringAsFixed(1)}',
                  ),
                  onTap: () {
                    // Navigate to movie details screen
                  },
                );
              },
            ),

          ),
        ],
      ),
    );
  }
}