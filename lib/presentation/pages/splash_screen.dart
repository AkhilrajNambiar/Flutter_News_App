import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:news_feed_app/controller/auth/current_user_controller.dart';
import 'package:news_feed_app/presentation/router/app_router.dart';
import 'package:news_feed_app/utilities/constants/my_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final currenUserController = Get.find<IsLoggedInController>();

  @override
  void initState() {
    super.initState();
    currenUserController.isUserLoggedIn();
    Timer(const Duration(seconds: 1), () {
      if (mounted) {
        if (currenUserController.loggedIn.value) {
          context.goNamed(NewsPages.home.name);
        } else {
          context.goNamed(NewsPages.login.name);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: Center(
            child: Image.asset(
              NewsAssets.getPathBasedOnPlatform(NewsAssets.newsLoader),
            ),
          ),
        ),
      );
}
