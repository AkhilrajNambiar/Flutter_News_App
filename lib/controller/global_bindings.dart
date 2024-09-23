import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_feed_app/controller/auth/current_user_controller.dart';
import 'package:news_feed_app/controller/auth/login_controller.dart';
import 'package:news_feed_app/controller/auth/logout_controller.dart';
import 'package:news_feed_app/controller/auth/registration_controller.dart';
import 'package:news_feed_app/controller/notification/notification_controller.dart';
import 'package:news_feed_app/controller/posts/post_creation_controller.dart';
import 'package:news_feed_app/controller/posts/post_detail_controller.dart';
import 'package:news_feed_app/controller/posts/post_updation_controller.dart';
import 'package:news_feed_app/controller/posts/posts_controller.dart';
import 'package:news_feed_app/controller/theme_controller.dart';
import 'package:news_feed_app/data/auth/auth_repo.dart';
import 'package:news_feed_app/data/fcm/fcm_repo.dart';
import 'package:news_feed_app/data/posts/posts_repo.dart';
import 'package:news_feed_app/data/preferences.dart';

class GlobalBindings extends Bindings {
  static late PreferenceManager _preferenceManager;
  static PreferenceManager get preferenceManager => _preferenceManager;

  @override
  void dependencies() {
    // Repository
    Get.lazyPut(
      () => AuthRepository(preferenceManager: _preferenceManager),
    );
    Get.lazyPut(
      () => PostsRepository(preferenceManager: _preferenceManager),
    );
    Get.lazyPut(
      () => FcmRepository(
        preferenceManager: _preferenceManager,
      ),
    );
    // Controllers
    Get.put(
      LoginController(authRepository: Get.find()),
      permanent: true,
    );
    Get.put(
      RegistrationController(
        authRepository: Get.find(),
        postsRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put(
      IsLoggedInController(authRepository: Get.find()),
      permanent: true,
    );
    Get.lazyPut(
      () => ThemeController(
        preferenceManager: _preferenceManager,
      ),
    );
    Get.put(
      PostCreationController(postsRepository: Get.find()),
    );
    Get.put(
      PostsController(postsRepository: Get.find()),
    );
    Get.put(
      PostDetailController(),
    );
    Get.put(
      LogoutController(authRepository: Get.find()),
    );
    Get.put(
      PostUpdationController(postsRepository: Get.find()),
    );
    Get.put(
      NotificationController(fcmRepository: Get.find()),
    );
  }

  static Future<void> initPreferenceManager() async {
    if (kIsWeb) {
      await Hive.initFlutter();
    }
    var _hiveBox = await Hive.openBox<Object?>('News Prefs');
    _preferenceManager = PreferenceManager(hiveBox: _hiveBox);
  }
}
