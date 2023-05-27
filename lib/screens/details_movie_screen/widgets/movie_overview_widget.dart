import 'package:flutter/material.dart';

class MovieOverview extends StatelessWidget {
  final String movieOverview;

  const MovieOverview({super.key, required this.movieOverview});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 400,
      left: 4,
      right: 4,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.orange[200],
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Text(
                    movieOverview,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
