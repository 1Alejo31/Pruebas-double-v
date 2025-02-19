import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const seedColor = Colors.purple;

    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: seedColor,
      ),
    );
  }
}
