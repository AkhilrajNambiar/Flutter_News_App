import 'package:get/get.dart';
import 'package:news_feed_app/data/auth/auth_repo.dart';

class RegistrationController extends GetxController {
  RegistrationController({
    required AuthRepository authRepository,
  }) {
    _authRepository = authRepository;
  }

  late final AuthRepository _authRepository;

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  Future<void> registerUser() async {
    isLoading.value = true;
    await _authRepository.registerUser(
      email: email.value,
      password: password.value,
    );
    isLoading.value = false;
  }
}
