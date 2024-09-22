import 'package:get/get.dart';
import 'package:news_feed_app/data/posts/posts_repo.dart';

class PostUpdationController extends GetxController {
  PostUpdationController({required PostsRepository postsRepository}) {
    _postsRepository = postsRepository;
  }

  late final PostsRepository _postsRepository;

  final title = ''.obs;
  final content = ''.obs;
  final uid = ''.obs;
  final postId = ''.obs;
  final isLoading = false.obs;

  Future<void> updatePost() async {
    isLoading.value = true;
    await _postsRepository.updatePost(
      uid: uid.value,
      postId: postId.value,
      title: title.value,
      content: content.value,
    );
    isLoading.value = false;
  }
}
