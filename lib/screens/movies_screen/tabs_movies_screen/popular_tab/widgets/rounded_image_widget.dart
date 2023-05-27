import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class RoundedImage extends StatelessWidget {
  final String imageUrl;

  const RoundedImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 150.0,
        height: 210.0,
        fit: BoxFit.cover,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.orange[300]!,
          highlightColor: Colors.orange[100]!,
          child: Container(
            width: 150.0,
            height: 210.0,
            color: Colors.white,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
