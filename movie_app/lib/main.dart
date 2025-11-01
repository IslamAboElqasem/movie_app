import 'package:flutter/material.dart';
import 'package:movie_app/Core/theme/dark_theme.dart';
import 'package:movie_app/Core/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, // أو ThemeMode.light / ThemeMode.dark
      home: Container(),
    );
  }
}
