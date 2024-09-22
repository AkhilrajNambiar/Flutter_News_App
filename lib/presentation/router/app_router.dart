import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_feed_app/presentation/pages/auth/login_screen.dart';
import 'package:news_feed_app/presentation/pages/auth/registration_screen.dart';
import 'package:news_feed_app/presentation/pages/home_screen.dart';
import 'package:news_feed_app/presentation/pages/posts/create_post_screen.dart';
import 'package:news_feed_app/presentation/pages/posts/post_detail_screen.dart';
import 'package:news_feed_app/presentation/pages/posts/update_post_screen.dart';
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
        child: HomeScreen(),
      ),
    ),
    GoRoute(
      name: NewsPages.createPost.name,
      path: NewsPages.createPost.path,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: CreatePostScreen(),
      ),
    ),
    GoRoute(
      name: NewsPages.updatePost.name,
      path: NewsPages.updatePost.path,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: UpdatePostScreen(),
      ),
    ),
    GoRoute(
      name: NewsPages.postDetail.name,
      path: NewsPages.postDetail.path,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: PostDetailScreen(),
      ),
    ),
  ]);
}

enum NewsPages {
  splash('splash', '/splash'),
  login('login', '/login'),
  register('register', '/register'),
  home('home', '/home'),
  createPost('create-post', '/create-post'),
  updatePost('update-post', '/update-post'),
  postDetail('post-detail', '/post-detail');

  const NewsPages(this.name, this.path);

  final String name;
  final String path;
}
