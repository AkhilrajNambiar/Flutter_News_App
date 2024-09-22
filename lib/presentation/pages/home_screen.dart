import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:news_feed_app/controller/posts/post_detail_controller.dart';
import 'package:news_feed_app/controller/posts/post_updation_controller.dart';
import 'package:news_feed_app/controller/posts/posts_controller.dart';
import 'package:news_feed_app/presentation/components/news_app_bar.dart';
import 'package:news_feed_app/presentation/router/app_router.dart';
import 'package:news_feed_app/utilities/constants/my_text_styles.dart';
import 'package:news_feed_app/utilities/constants/news_toasts.dart';
import 'package:news_feed_app/utilities/extensions.dart';
import 'package:news_feed_app/utilities/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final postscontroller = Get.find<PostsController>();
  final postDetailController = Get.find<PostDetailController>();
  final postUpdationController = Get.find<PostUpdationController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: NewsAppBar(
          customTitle: 'Home',
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            context.goNamed(NewsPages.createPost.name);
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        body: Obx(
          () => postscontroller.isLoading.value
              ? SpinKitFadingCircle(
                  size: 24.sh(context),
                  color: Theme.of(context).colorScheme.secondary,
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 20.sh(context),
                      child: const Row(
                        children: [],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...postscontroller.posts.map(
                              (post) => Container(
                                padding: EdgeInsets.only(
                                  bottom: 60.sh(context),
                                ),
                                width: 1.sw(context) > 500
                                    ? 1.5.sw(context)
                                    : 1.sw(context),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (postscontroller.canEditPost(
                                          uid: post.authorUid,
                                          postId: post.timestamp.toString(),
                                        )) {
                                          postUpdationController.title.value =
                                              post.title;
                                          postUpdationController.content.value =
                                              post.content;
                                          postUpdationController.postId.value =
                                              post.timestamp.toString();
                                          postUpdationController.uid.value =
                                              post.authorUid;
                                          context.goNamed(
                                              NewsPages.updatePost.name);
                                        } else {
                                          newsErrorToast(
                                            'You can only update your own posts!',
                                            context,
                                          );
                                        }
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: 1.sw(context) > 500
                                          ? 2.sw(context)
                                          : 1.2.sw(context),
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        tileColor: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.5),
                                        title: Text(
                                          post.title,
                                          style: NewsTextStyles.primaryText500
                                              .copyWith(
                                            fontSize: 50.sh(context),
                                          ),
                                        ),
                                        subtitle: Text(
                                          post.content,
                                          style: NewsTextStyles.primaryText500
                                              .copyWith(
                                            fontSize: 61.sh(context),
                                            color: HelperFunctions.isDarkMode(
                                                    context)
                                                ? Colors.grey[200]
                                                : Colors.grey[700],
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        trailing: Visibility(
                                          visible: 1.sw(context) > 1000,
                                          child: Text(
                                            'By ${post.authorName}',
                                            style: NewsTextStyles.primaryText500
                                                .copyWith(
                                              fontSize: 50.sh(context),
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          postDetailController.title.value =
                                              post.title;
                                          postDetailController.content.value =
                                              post.content;
                                          postDetailController.authorName
                                              .value = post.authorName;
                                          context.goNamed(
                                              NewsPages.postDetail.name);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        try {
                                          await postscontroller.deletePost(
                                            uid: post.authorUid,
                                            postId: post.timestamp.toString(),
                                          );
                                          newsSuccessToast(
                                            'Post deleted successfully!',
                                            context,
                                          );
                                        } catch (e) {
                                          newsErrorToast(e.toString(), context);
                                        }
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      );
}
