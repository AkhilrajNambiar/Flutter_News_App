import 'package:get/get.dart';
import 'package:news_feed_app/controller/auth/current_user_controller.dart';
import 'package:news_feed_app/controller/auth/login_controller.dart';
import 'package:news_feed_app/controller/auth/registration_controller.dart';
import 'package:news_feed_app/data/auth/auth_repo.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(AuthRepository.new);
    Get.put(
      LoginController(authRepository: Get.find()),
      permanent: true,
    );
    Get.put(
      RegistrationController(authRepository: Get.find()),
      permanent: true,
    );
    Get.put(
      CurrentUserController(authRepository: Get.find()),
      permanent: true,
    );
  }
}
