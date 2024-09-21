import 'package:flutter/foundation.dart';

class NewsAssets {
  static const eyesOpen = '/assets/eye-open.svg';
  static const eyesClosed = '/assets/eye-closed.svg';
  static const newsLoader = '/assets/reading_news.gif';
  static String getPathBasedOnPlatform(String assetPath) {
    if (kIsWeb) {
      if (kDebugMode) {
        return assetPath.substring(8);
      } else {
        return assetPath.substring(1);
      }
    }
    return assetPath;
  }
}
