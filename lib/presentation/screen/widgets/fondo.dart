import 'package:flutter/material.dart';

fondoLogin() {
  return ClipRect(
    child: Image.asset(
      fit: BoxFit.cover,
      'assets/img/fondo2.png',
    ),
  );
}
