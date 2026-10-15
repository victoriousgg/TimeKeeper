import 'package:flutter/material.dart';
import 'package:timekeeper_app/screen/stop_watch_screen.dart';
import 'package:timekeeper_app/util/string_constants.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final darkThemeData = ThemeData(
      colorScheme: .fromSeed(
        seedColor: Colors.lightBlue,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );

    final lightThemeData = ThemeData(
      colorScheme: .fromSeed(seedColor: Colors.lightBlue),
      useMaterial3: true,
    );

    return MaterialApp(
      title: StringConstants.appName,
      themeMode: .system,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: const StopWatchScreen(),
    );
  }
}
