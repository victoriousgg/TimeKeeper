import 'package:flutter/material.dart';

abstract final class ThemeConstants {
  static final darkThemeData = ThemeData(
    colorScheme: .fromSeed(
      seedColor: Colors.lightBlue,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );

  static final lightThemeData = ThemeData(
    colorScheme: .fromSeed(seedColor: Colors.lightBlue),
    useMaterial3: true,
  );
}
