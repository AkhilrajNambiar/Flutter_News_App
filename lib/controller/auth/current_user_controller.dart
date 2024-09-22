import 'package:get/get.dart';
import 'package:news_feed_app/data/auth/auth_repo.dart';

class IsLoggedInController extends GetxController {
  IsLoggedInController({required AuthRepository authRepository}) {
    _authRepository = authRepository;
  }

  late final AuthRepository _authRepository;

  final loggedIn = false.obs;

  isUserLoggedIn() {
    loggedIn.value = _authRepository.isUserLoggedIn();
  }
}
