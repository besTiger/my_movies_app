import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text(
            "This is Favorite Screen",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        )
      ],
    );
  }
}
