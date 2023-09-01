import 'package:flight/core/view/widgets/image/cached_image.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onPressed;
  const CountryCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: InkWell(
          onTap: onPressed,
          child: ListTile(
            title: Text(title),
            trailing: FlightCacheImage(imageUrl: imageUrl),
          ),
        ),
      ),
    );
  }
}
