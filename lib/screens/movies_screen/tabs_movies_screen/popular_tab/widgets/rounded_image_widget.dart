import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imageUrl;

  const RoundedImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Image.network(
        imageUrl,
        width: 150.0,
        height: 210.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
