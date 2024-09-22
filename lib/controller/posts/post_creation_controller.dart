import 'package:get/get.dart';
import 'package:news_feed_app/data/posts/posts_repo.dart';

class PostCreationController extends GetxController {
  PostCreationController({required PostsRepository postsRepository}) {
    _postsRepository = postsRepository;
  }

  late final PostsRepository _postsRepository;

  final title = ''.obs;
  final content = ''.obs;
  final isLoading = false.obs;

  Future<void> createPostForUser() async {
    isLoading.value = true;
    await _postsRepository.createPostForUser(
      title: title.value,
      content: content.value,
    );
    isLoading.value = false;
  }
}
