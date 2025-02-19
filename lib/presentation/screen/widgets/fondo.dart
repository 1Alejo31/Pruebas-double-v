import 'package:flutter/material.dart';

class CustomFontLogin extends StatelessWidget {
  const CustomFontLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Image.asset(
        fit: BoxFit.cover,
        'assets/img/fondo2.png',
      ),
    );
  }
}
