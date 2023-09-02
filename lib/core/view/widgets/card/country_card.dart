import 'package:flight/core/view/widgets/image/cached_image.dart';
import 'package:flight/core/view/widgets/lottie/lottie_widget.dart';
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
    final pageWidth = MediaQuery.of(context).size.width;
    final pageHeight = MediaQuery.of(context).size.height;
    return Card(
      child: Center(
        child: InkWell(
          onTap: onPressed,
          child: ListTile(
            title: Text(title),
            leading: const LottieCustomWidget(path: "leading"),
            trailing: FlightCacheImage(
              imageUrl: imageUrl,
              width: pageWidth * .1,
              height: pageHeight * .1,
            ),
          ),
        ),
      ),
    );
  }
}
