import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double starSize;
  final Color starColor;
  final Color unratedStarColor;
  final double borderWidth;
  final Color borderColor;
  final TextStyle ratingTextStyle;

  const RatingStars({
    Key? key,
    required this.rating,
    this.starSize = 24,
    this.starColor = Colors.orange,
    this.unratedStarColor = Colors.grey,
    this.borderWidth = 2.0,
    this.borderColor = Colors.black,
    this.ratingTextStyle = const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int filledStars = (rating / 2).floor();
    final double remainingRating = rating / 2 - filledStars;

    List<Widget> starWidgets = List.generate(
      5,
          (index) {
        if (index < filledStars) {
          return Icon(
            Icons.star,
            size: starSize,
            color: starColor,
          );
        } else if (index == filledStars && remainingRating > 0) {
          return Icon(
            Icons.star_half,
            size: starSize,
            color: starColor,
          );
        } else {
          return Icon(
            Icons.star_border,
            size: starSize,
            color: unratedStarColor,
          );
        }
      },
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(starSize / 2),
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: starWidgets,
          ),
        ),
        SizedBox(width: 4),
        Text(
          rating.toString(),
          style: ratingTextStyle,
        ),
      ],
    );
  }
}


