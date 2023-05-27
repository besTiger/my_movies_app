import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      right: 22,
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 2.0),
        ),
        child: IconButton(
          onPressed: () {
            // Handle favorite button pressed
          },
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
          color: Colors.orange,
          iconSize: 40,
        ),
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 160,
      right: 22,
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 2.0),
        ),
        child: IconButton(
          onPressed: () {
            // Handle share button pressed
          },
          icon: const Icon(
            Icons.share,
            color: Colors.black,
          ),
          color: Colors.orange,
          iconSize: 40,
        ),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 250,
      right: 22,
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 2.0),
        ),
        child: IconButton(
          onPressed: () {
            // Handle play button pressed
          },
          icon: const Icon(
            Icons.play_arrow,
            color: Colors.black,
          ),
          color: Colors.orange,
          iconSize: 40,
        ),
      ),
    );
  }
}