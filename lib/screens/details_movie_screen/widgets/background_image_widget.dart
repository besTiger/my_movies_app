import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String imageUrl;

  const BackgroundImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}