import 'package:flutter/material.dart';

class ReleaseDate extends StatelessWidget {
  final String date;

  const ReleaseDate({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Release Date: $date',
      style: const TextStyle(fontSize: 16),
    );
  }
}
