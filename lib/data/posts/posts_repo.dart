import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_feed_app/data/model/post_model.dart';
import 'package:news_feed_app/data/preferences.dart';

class PostsRepository {
  PostsRepository({required PreferenceManager preferenceManager}) {
    _firestore = FirebaseFirestore.instance;
    _preferenceManager = preferenceManager;
  }
  late final FirebaseFirestore _firestore;
  late final PreferenceManager _preferenceManager;

  Future<void> createNewUserDocument() async {
    await _firestore
        .collection('news')
        .doc(_preferenceManager.getUid())
        .set({});
  }

  Future<void> createPostForUser({
    required String title,
    required String content,
  }) async {
    await _firestore
        .collection('news')
        .doc(_preferenceManager.getUid())
        .collection('posts')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(
      {
        'title': title,
        'content': content,
        'authorUid': _preferenceManager.getUid(),
        'authorName': _preferenceManager.getUsername(),
      },
    );
  }

  Stream<List<PostModel>> listenToNewPosts() =>
      _firestore.collectionGroup('posts').snapshots().map(
            (snapshot) => snapshot.docs.map(PostModel.fromFirestore).toList(),
          );

  Future<void> deletePost({required String uid, required String postId}) async {
    if (uid != _preferenceManager.getUid()) {
      throw Exception('You can only delete your own posts!');
    } else {
      await _firestore
          .collection('news')
          .doc(uid)
          .collection('posts')
          .doc(postId)
          .delete();
    }
  }

  bool canEditPost({required String uid, required String postId}) =>
      uid == _preferenceManager.getUid();

  Future<void> updatePost({
    required String uid,
    required String postId,
    required String title,
    required String content,
  }) async {
    if (uid != _preferenceManager.getUid()) {
      throw Exception('You can only update your own posts!');
    } else {
      await _firestore
          .collection('news')
          .doc(uid)
          .collection('posts')
          .doc(postId)
          .update(
        {
          'title': title,
          'content': content,
          'authorUid': _preferenceManager.getUid(),
          'authorName': _preferenceManager.getUsername(),
        },
      );
    }
  }
}
