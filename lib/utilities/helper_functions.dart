import 'package:flutter/material.dart';

class HelperFunctions {
  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).colorScheme.brightness == Brightness.dark;
}
