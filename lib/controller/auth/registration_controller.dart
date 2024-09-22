import 'package:get/get.dart';
import 'package:news_feed_app/data/auth/auth_repo.dart';
import 'package:news_feed_app/data/posts/posts_repo.dart';

class RegistrationController extends GetxController {
  RegistrationController({
    required AuthRepository authRepository,
    required PostsRepository postsRepository,
  }) {
    _authRepository = authRepository;
    _postsRepository = postsRepository;
  }

  late final AuthRepository _authRepository;
  late final PostsRepository _postsRepository;

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  Future<void> registerUser() async {
    isLoading.value = true;
    await _authRepository.registerUser(
      email: email.value,
      password: password.value,
    );
    await _postsRepository.createNewUserDocument();
    isLoading.value = false;
  }
}
