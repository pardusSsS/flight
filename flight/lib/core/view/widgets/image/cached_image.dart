import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FlightCacheImage extends StatelessWidget {
  final String imageUrl;
  const FlightCacheImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: MediaQuery.of(context).size.width * 0.1,
      height: MediaQuery.of(context).size.height * 0.1,
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
