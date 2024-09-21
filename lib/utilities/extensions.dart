import 'package:flutter/material.dart';

extension ScreenDimensionExtension on num {
  double sw(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth / this;
  }

  double sh(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return screenHeight / this;
  }
}
