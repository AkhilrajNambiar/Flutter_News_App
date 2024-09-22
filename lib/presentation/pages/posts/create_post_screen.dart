import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:news_feed_app/controller/posts/post_creation_controller.dart';
import 'package:news_feed_app/presentation/components/news_app_bar.dart';
import 'package:news_feed_app/presentation/components/news_submit_button.dart';
import 'package:news_feed_app/presentation/components/news_text_field.dart';
import 'package:news_feed_app/utilities/constants/my_text_styles.dart';
import 'package:news_feed_app/utilities/constants/news_toasts.dart';
import 'package:news_feed_app/utilities/extensions.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({super.key});

  final postCreationController = Get.find<PostCreationController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: NewsAppBar(
          customTitle: 'Create Post',
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.sh(context),
                    child: const Row(
                      children: [],
                    ),
                  ),
                  SizedBox(
                    width: 2.sw(context),
                    child: Text(
                      'Title',
                      style: NewsTextStyles.primaryText500.copyWith(
                        fontSize: 50.sh(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.sh(context),
                  ),
                  NewsTextField(
                    fontSize: 57.14.sh(context),
                    width: 2.sw(context),
                    height: 19.036.sh(context),
                    onChanged: (text) {
                      postCreationController.title.value = text;
                    },
                  ),
                  SizedBox(
                    height: 20.sh(context),
                  ),
                  SizedBox(
                    width: 2.sw(context),
                    child: Text(
                      'Content',
                      style: NewsTextStyles.primaryText500.copyWith(
                        fontSize: 50.sh(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.sh(context),
                  ),
                  NewsTextField(
                    isSingleLine: false,
                    maxLines: 2,
                    fontSize: 57.14.sh(context),
                    width: 2.sw(context),
                    height: 12.8.sh(context),
                    onChanged: (text) {
                      postCreationController.content.value = text;
                    },
                  ),
                  SizedBox(
                    height: 10.sh(context),
                  ),
                  Obx(
                    () => NewsSubmitButton(
                      text: 'Upload',
                      fontSize: 40.sh(context),
                      width: 2.sw(context),
                      height: 17.036.sh(context),
                      context: context,
                      prefixIcon: postCreationController.isLoading.value
                          ? SpinKitFadingCircle(
                              size: 53.sh(context),
                              color: Theme.of(context).colorScheme.surface,
                            )
                          : null,
                      onTap: () async {
                        try {
                          await postCreationController.createPostForUser();
                          newsSuccessToast('Post creation success!', context);
                          window.history.back();
                        } catch (e) {
                          newsErrorToast(e.toString(), context);
                          postCreationController.isLoading.value = false;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
