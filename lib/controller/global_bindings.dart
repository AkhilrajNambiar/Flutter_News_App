import 'package:get/get.dart';
import 'package:news_feed_app/controller/login_controller.dart';
import 'package:news_feed_app/data/auth/auth_repo.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(AuthRepository.new);
    Get.put(LoginController(authRepository: Get.find()), permanent: true);
  }
}
