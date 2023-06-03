import 'dart:async';
import 'package:flutter/material.dart';
import 'genre_button_widget.dart';

class SearchBarTest extends StatelessWidget {
  const SearchBarTest({
    Key? key,
    required this.searchController,
    required this.debounceTimer,
    required this.onSearchTextChanged,
    required this.onClearSearch,
    required this.genres,
    required this.selectedGenre,
    required this.onGenreSelected,
  }) : super(key: key);

  final TextEditingController searchController;
  final Timer? debounceTimer;
  final ValueChanged<String> onSearchTextChanged;
  final VoidCallback onClearSearch;
  final List<String> genres;
  final String selectedGenre;
  final ValueChanged<String> onGenreSelected;




  @override
  Widget build(BuildContext context) {
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
              onChanged: onSearchTextChanged,
              decoration: InputDecoration(
                labelText: 'Search movies...',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 24.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                    size: 24.0,
                  ),
                  onPressed: onClearSearch,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16.0,
              runSpacing: 8.0,
              children: genres.map((genre) {
                return GenreButton(
                  genre: genre,
                  isSelected: selectedGenre == genre,
                  onPressed: () => onGenreSelected(genre),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}