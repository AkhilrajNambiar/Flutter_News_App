import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_feed_app/presentation/router/app_router.dart';
import 'package:news_feed_app/utilities/constants/my_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      if (mounted) {
        context.goNamed(NewsPages.login.name);
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
