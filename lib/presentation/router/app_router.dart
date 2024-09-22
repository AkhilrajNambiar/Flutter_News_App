import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_feed_app/presentation/pages/home_screen.dart';
import 'package:news_feed_app/presentation/pages/login_screen.dart';
import 'package:news_feed_app/presentation/pages/registration_screen.dart';
import 'package:news_feed_app/presentation/pages/splash_screen.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router =
      GoRouter(initialLocation: NewsPages.splash.path, routes: [
    GoRoute(
      name: NewsPages.splash.name,
      path: NewsPages.splash.path,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      name: NewsPages.login.name,
      path: NewsPages.login.path,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      name: NewsPages.register.name,
      path: NewsPages.register.path,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: RegistrationScreen(),
      ),
    ),
    GoRoute(
      name: NewsPages.home.name,
      path: NewsPages.home.path,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
  ]);
}

enum NewsPages {
  splash('splash', '/splash'),
  login('login', '/login'),
  register('register', '/register'),
  home('home', '/home');

  const NewsPages(this.name, this.path);

  final String name;
  final String path;
}
