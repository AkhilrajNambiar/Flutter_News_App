import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:news_feed_app/data/auth/auth_repo.dart';

class CurrentUserController extends GetxController {
  CurrentUserController({required AuthRepository authRepository}) {
    _authRepository = authRepository;
  }

  late final AuthRepository _authRepository;

  final user = Rx<User?>(null);

  getCurrentUser() {
    user.value = _authRepository.getLoggedInUser();
  }
}
