import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String src;
  final int topData;

  const CustomImage({
    super.key,
    required this.src,
    required this.topData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topData.toDouble()),
      child: Image.asset(
        src,
      ),
    );
  }
}
