import 'package:get/state_manager.dart';
import 'package:news_feed_app/data/auth/auth_repo.dart';

class LoginController extends GetxController {
  LoginController({
    required AuthRepository authRepository,
  }) {
    _authRepository = authRepository;
  }

  late final AuthRepository _authRepository;

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  Future<void> loginUser() async {
    isLoading.value = true;
    await _authRepository.loginUser(
        email: email.value, password: password.value);
    isLoading.value = false;
  }
}
