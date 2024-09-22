import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_feed_app/controller/global_bindings.dart';
import 'package:news_feed_app/controller/theme_controller.dart';
import 'package:news_feed_app/firebase_options.dart';
import 'package:news_feed_app/presentation/news_app_theme.dart';
import 'package:news_feed_app/presentation/router/app_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GlobalBindings.initPreferenceManager();
  GlobalBindings().dependencies();
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  NewsApp({super.key});

  final themeController = Get.find<ThemeController>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Obx(
        () => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'NewsApp',
          themeMode: themeController.isDarkTheme.value
              ? ThemeMode.dark
              : ThemeMode.light,
          theme: NewsAppTheme.lightTheme,
          darkTheme: NewsAppTheme.darkTheme,
          routerConfig: AppRouter.router,
        ),
      );
}
