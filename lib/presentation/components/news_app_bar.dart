import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_feed_app/controller/auth/logout_controller.dart';
import 'package:news_feed_app/controller/theme_controller.dart';
import 'package:news_feed_app/presentation/components/news_submit_button.dart';
import 'package:news_feed_app/utilities/constants/my_text_styles.dart';
import 'package:news_feed_app/utilities/extensions.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  NewsAppBar({
    super.key,
    required this.customTitle,
    this.showLogout = true,
  });

  late final String customTitle;
  late final bool showLogout;

  final themeController = Get.find<ThemeController>();
  final logoutController = Get.find<LogoutController>();

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          customTitle,
          style: NewsTextStyles.primaryText500.copyWith(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        leading: Obx(
          () => GestureDetector(
            onTap: themeController.setIsDarkTheme,
            child: themeController.isDarkTheme.value
                ? Icon(
                    Icons.dark_mode,
                    color: Theme.of(context).colorScheme.surface,
                  )
                : Icon(
                    Icons.sunny,
                    color: Theme.of(context).colorScheme.surface,
                  ),
          ),
        ),
        actions: [
          Visibility(
            visible: showLogout,
            child: Padding(
              padding: EdgeInsets.only(
                right: 80.sw(context),
              ),
              child: NewsSubmitButton(
                text: 'Logout',
                fontSize: 50.sh(context),
                width: 80,
                height: 19.sh(context),
                onTap: () async {
                  await logoutController.logout();
                  var count = window.history.length;
                  var countBackLength = 1;
                  while (count != countBackLength) {
                    window.history.back();
                    count--;
                  }
                },
                context: context,
              ),
            ),
          )
        ],
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
