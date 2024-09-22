import 'package:get/get.dart';
import 'package:news_feed_app/data/preferences.dart';

class ThemeController extends GetxController {
  ThemeController({required PreferenceManager preferenceManager}) {
    isDarkTheme.value = preferenceManager.isDarkMode();
    _preferenceManager = preferenceManager;
  }

  late final PreferenceManager _preferenceManager;

  final isDarkTheme = false.obs;

  void setIsDarkTheme() async {
    await _preferenceManager.setDarkMode(!isDarkTheme.value);
    isDarkTheme.value = !isDarkTheme.value;
  }
}
