import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:news_feed_app/controller/auth/registration_controller.dart';
import 'package:news_feed_app/presentation/components/news_app_bar.dart';
import 'package:news_feed_app/presentation/components/news_submit_button.dart';
import 'package:news_feed_app/presentation/components/news_text_field.dart';
import 'package:news_feed_app/presentation/router/app_router.dart';
import 'package:news_feed_app/utilities/constants/my_text_styles.dart';
import 'package:news_feed_app/utilities/constants/news_toasts.dart';
import 'package:news_feed_app/utilities/extensions.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final registrationController = Get.find<RegistrationController>();

  String? passwordValidation() => registrationController.password.isEmpty
      ? 'Password cannot be empty'
      : registrationController.password.value.length < 5
          ? 'Password should be atleast 5 chars'
          : null;

  String? emailValidation() =>
      registrationController.email.isEmpty ? 'Email cannot be empty' : null;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: NewsAppBar(
          customTitle: 'Register',
          showLogout: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.sh(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 2.sw(context),
                        child: Text(
                          'Hi there! Please create an account to get started',
                          style: NewsTextStyles.primaryText700.copyWith(
                            fontSize: 1.sw(context) > 800
                                ? 19.sh(context)
                                : 1.sw(context) > 400
                                    ? 30.sh(context)
                                    : 40.sh(context),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.sh(context),
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
                      registrationController.email.value = text;
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
                      registrationController.password.value = text;
                    },
                  ),
                  SizedBox(
                    height: 10.sh(context),
                  ),
                  Obx(
                    () => NewsSubmitButton(
                      text: 'Register',
                      fontSize: 40.sh(context),
                      width: 2.sw(context),
                      height: 19.036.sh(context),
                      context: context,
                      prefixIcon: registrationController.isLoading.value
                          ? SpinKitFadingCircle(
                              size: 53.sh(context),
                              color: Theme.of(context).colorScheme.surface,
                            )
                          : null,
                      onTap: () async {
                        if (emailValidation() == null &&
                            passwordValidation() == null) {
                          try {
                            await registrationController.registerUser();
                            newsSuccessToast(
                                'Account Creation Successful!', context);
                            context.goNamed(NewsPages.home.name);
                          } catch (e) {
                            newsErrorToast(e.toString(), context);
                            registrationController.isLoading.value = false;
                          }
                        } else {
                          if (emailValidation() != null) {
                            newsErrorToast(emailValidation()!, context);
                          } else if (passwordValidation() != null) {
                            newsErrorToast(passwordValidation()!, context);
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40.sh(context),
                  ),
                  SizedBox(
                    width: 2.sw(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: NewsTextStyles.primaryText500.copyWith(
                            fontSize: 61.54.sh(context),
                          ),
                        ),
                        InkWell(
                          onTap: () => context.goNamed(NewsPages.login.name),
                          child: Text(
                            'Login',
                            style: NewsTextStyles.primaryText500.copyWith(
                              fontSize: 61.54.sh(context),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
