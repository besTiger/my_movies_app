import 'package:flutter/material.dart';

class OverviewText extends StatelessWidget {
  final String overview;

  const OverviewText({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Text(
      overview,
      style: const TextStyle(fontSize: 16),
    );
  }
}
