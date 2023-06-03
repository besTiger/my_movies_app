import 'package:flutter/material.dart';

class GenreButton extends StatelessWidget {
  const GenreButton({
    Key? key,
    required this.genre,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String genre;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: isSelected ? Colors.orange : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      ),
      onPressed: onPressed,
      child: Text(
        genre,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}