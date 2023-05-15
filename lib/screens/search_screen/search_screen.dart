import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text(
            "This is Search Screen",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        )
      ],
    );
  }
}
