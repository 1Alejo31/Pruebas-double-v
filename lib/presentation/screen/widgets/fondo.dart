import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  final String src;
  const CustomFont({super.key, required this.src});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        src,
        fit: BoxFit.cover,
      ),
    );
  }
}
