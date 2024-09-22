import 'package:get/get.dart';
import 'package:news_feed_app/data/auth/auth_repo.dart';

class LogoutController extends GetxController {
  LogoutController({required AuthRepository authRepository}) {
    _authRepository = authRepository;
  }

  late final AuthRepository _authRepository;

  Future<void> logout() async {
    await _authRepository.logout();
  }
}
