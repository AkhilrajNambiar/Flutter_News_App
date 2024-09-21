import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_feed_app/utilities/constants/my_text_styles.dart';
import 'package:news_feed_app/utilities/helper_functions.dart';

void newsSuccessToast(String msg, BuildContext context) {
  try {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(
        msg,
        style: NewsTextStyles.primaryText500.copyWith(
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      backgroundColor: !HelperFunctions.isDarkMode(context)
          ? Colors.green
          : Colors.green[100],
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      elevation: 0,
    ));
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

void newsErrorToast(String msg, BuildContext context) {
  try {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(
        msg,
        style: NewsTextStyles.primaryText400.copyWith(
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      backgroundColor:
          !HelperFunctions.isDarkMode(context) ? Colors.red : Colors.red[100],
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      elevation: 0,
    ));
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

void newsWarningToast(String msg, BuildContext context) {
  try {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(
        msg,
        style: NewsTextStyles.primaryText400.copyWith(
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      backgroundColor: !HelperFunctions.isDarkMode(context)
          ? Colors.yellow[700]
          : Colors.yellow[200],
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      elevation: 0,
    ));
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
