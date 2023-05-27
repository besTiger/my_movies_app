import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  final String imageUrl;

  const MovieImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}