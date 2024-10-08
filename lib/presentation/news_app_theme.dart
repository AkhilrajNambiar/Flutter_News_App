import 'package:flutter/material.dart';

class NewsAppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.pink,
      error: Colors.red,
      surface: Colors.white,
      onPrimary: Colors.black,
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blue[300],
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
      primary: Colors.blue[300]!,
      secondary: Colors.pink[200]!,
      error: Colors.red[300]!,
      surface: Colors.black,
      onPrimary: Colors.white,
    ),
  );
}
