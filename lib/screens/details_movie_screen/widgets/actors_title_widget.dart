import 'package:flutter/material.dart';

class ActorsTitle extends StatelessWidget {
  const ActorsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Actors:',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}