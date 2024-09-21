import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:news_feed_app/controller/login_controller.dart';
import 'package:news_feed_app/presentation/components/news_submit_button.dart';
import 'package:news_feed_app/presentation/components/news_text_field.dart';
import 'package:news_feed_app/utilities/constants/my_text_styles.dart';
import 'package:news_feed_app/utilities/constants/news_toasts.dart';
import 'package:news_feed_app/utilities/extensions.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.sh(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 2.sw(context),
                        child: Text(
                          'Welcome back! Please login to continue',
                          style: NewsTextStyles.primaryText700.copyWith(
                            fontSize: 19.sh(context),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.sh(context),
                  ),
                  SizedBox(
                    width: 2.sw(context),
                    child: Text(
                      'Email',
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
                      loginController.email.value = text;
                    },
                  ),
                  SizedBox(
                    height: 20.sh(context),
                  ),
                  SizedBox(
                    width: 2.sw(context),
                    child: Text(
                      'Password',
                      style: NewsTextStyles.primaryText500.copyWith(
                        fontSize: 50.sh(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.sh(context),
                  ),
                  NewsTextField(
                    isForPassword: true,
                    fontSize: 57.14.sh(context),
                    width: 2.sw(context),
                    height: 19.036.sh(context),
                    onChanged: (text) {
                      loginController.password.value = text;
                    },
                  ),
                  SizedBox(
                    height: 10.sh(context),
                  ),
                  Obx(
                    () => NewsSubmitButton(
                      text: 'Login',
                      fontSize: 40.sh(context),
                      width: 2.sw(context),
                      height: 19.036.sh(context),
                      context: context,
                      prefixIcon: loginController.isLoading.value
                          ? SpinKitFadingCircle(
                              size: 53.sh(context),
                              color: Theme.of(context).colorScheme.surface,
                            )
                          : null,
                      onTap: () async {
                        try {
                          await loginController.loginUser();
                          newsSuccessToast('Login Success!', context);
                        } catch (e) {
                          newsErrorToast(e.toString(), context);
                          loginController.isLoading.value = false;
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
