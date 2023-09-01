import 'package:flutter/material.dart';

class BottomsheetTopDivider extends StatelessWidget {
  final Color colors;
  final double? indent;
  const BottomsheetTopDivider(
      {super.key, required this.colors, required this.indent});

  @override
  Widget build(BuildContext context) {
    final pageWidth = MediaQuery.of(context).size.width;
    return Divider(
      color: Colors.grey,
      indent: pageWidth * (indent! ?? 0),
      endIndent: pageWidth * (indent! ?? 0),
      thickness: 2,
    );
  }
}
