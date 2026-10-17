import 'package:flutter/material.dart';
import 'package:timekeeper_app/screen/base_layout_screen.dart';
import 'package:timekeeper_app/util/string_constants.dart';
import 'package:timekeeper_app/util/theme_constants.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      themeMode: .system,
      theme: ThemeConstants.lightThemeData,
      darkTheme: ThemeConstants.darkThemeData,
      home: const BaseLayout(),
    ),
  );
}
