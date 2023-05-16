import 'package:flutter/material.dart';

class OverviewTitle extends StatelessWidget {
  const OverviewTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Overview:',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}