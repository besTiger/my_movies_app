import 'package:flutter/material.dart';

class BackToTopButton extends StatelessWidget {
  const BackToTopButton({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      backgroundColor: Colors.orange,
      foregroundColor: Colors.black,
      child: const Icon(Icons.arrow_upward),
    );
  }
}

