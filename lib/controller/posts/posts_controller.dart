import 'package:get/get.dart';
import 'package:news_feed_app/data/model/post_model.dart';
import 'package:news_feed_app/data/posts/posts_repo.dart';

class PostsController extends GetxController {
  PostsController({required PostsRepository postsRepository}) {
    _postsRepository = postsRepository;
  }

  late final PostsRepository _postsRepository;

  final posts = <PostModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    listenToPosts();
  }

  void listenToPosts() {
    final postStream = _postsRepository.listenToNewPosts();
    postStream.first.then((firstSetOfPosts) {
      posts.value = firstSetOfPosts;
      isLoading.value = false;
    });
    posts.bindStream(postStream);
  }

  Future<void> deletePost({required String uid, required String postId}) async {
    await _postsRepository.deletePost(uid: uid, postId: postId);
  }

  bool canEditPost({required String uid, required String postId}) =>
      _postsRepository.canEditPost(
        uid: uid,
        postId: postId,
      );
}
