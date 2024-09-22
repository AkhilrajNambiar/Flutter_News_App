import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_feed_app/controller/posts/post_detail_controller.dart';
import 'package:news_feed_app/presentation/components/news_app_bar.dart';
import 'package:news_feed_app/utilities/constants/my_text_styles.dart';
import 'package:news_feed_app/utilities/extensions.dart';

class PostDetailScreen extends StatelessWidget {
  PostDetailScreen({super.key});

  final postController = Get.find<PostDetailController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: NewsAppBar(customTitle: 'Post by ${postController.authorName}'),
        body: Column(
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
                postController.title.value,
                style: NewsTextStyles.primaryText800.copyWith(
                  fontSize: 40.sh(context),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.sh(context),
            ),
            SizedBox(
              width: 2.sw(context),
              child: Text(
                postController.content.value,
                style: NewsTextStyles.primaryText800.copyWith(
                  fontSize: 55.sh(context),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
