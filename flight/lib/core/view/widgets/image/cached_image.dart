import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FlightCacheImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  const FlightCacheImage(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    final pageWidth = MediaQuery.of(context).size.width;
    final pageHeight = MediaQuery.of(context).size.height;
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width ?? pageWidth * 0.1,
      height: height ?? pageHeight * 0.1,
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
