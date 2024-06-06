import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/presentation/common/common_text_field.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/custom_colors.dart';
import '../../../core/resources/dimensions.dart';
import '../../../core/resources/strings.dart';
import '_components/remember_me.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.dismissKeyboard(),
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: CustomColors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark
        ),
        child: Scaffold(
          backgroundColor: CustomColors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomScrollView(
              slivers: [ 
                SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: false,
                  child: GetBuilder<LoginController>(
                    builder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: Dimensions.buttonHeight),
                          const Text(
                            "Welcome Back",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          const Text(
                            "Login to continue.",
                            style: TextStyle(
                              color: CustomColors.grey400,
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          Center(
                            child: Hero(
                              tag: "logo",
                              child: Image.asset(
                                Assets.logo,
                                height: 161,
                                width: 164,
                              ),
                            ),
                          ),
                          const Text(
                            Strings.email,
                            style: TextStyle(
                              color: CustomColors.grey400,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          CommonTextField(
                            controller: controller.emailController,
                            errorText: controller.emailError.value,
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                            contentPadding: const EdgeInsets.only(
                              left: Dimensions.largeSpacing,
                              right: Dimensions.largeSpacing,
                            ),
                            onChanged: (value) {
                              controller.isFieldFilled.value = value.isNotEmpty;
                              controller.emailError.value = "";
                              controller.update();
                            },
                            prefixIcon: Image.asset(Assets.icEmail),
                            hintText: Strings.email,
                            textStyle: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          controller.emailError.value.isNotEmpty
                          ? AnimatedContainer(
                            duration: 100.milliseconds,
                            height: controller.emailError.value.isEmpty ? 0 : 30.0,
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              controller.emailError.value,
                              style: const TextStyle(
                                color: CustomColors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ) 
                          : const SizedBox.shrink(),
                            const SizedBox(height: Dimensions.extraLargeSpacing),
                          const Text(
                            Strings.password,
                            style: TextStyle(
                              color: CustomColors.grey400,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          CommonTextField(
                            controller: controller.passwordController,
                            errorText: controller.passwordError.value,
                            maxLines: 1,
                            isSecure: true,
                            hasShowHideTextIcon: true,
                            textInputAction: TextInputAction.done,
                            contentPadding: const EdgeInsets.only(
                              left: Dimensions.largeSpacing,
                              right: Dimensions.largeSpacing,
                            ),
                            onChanged: (value) {
                              controller.isFieldFilled.value = value.isNotEmpty;
                              controller.passwordError.value = "";
                              controller.update();
                            },
                            prefixIcon: Image.asset(Assets.icPassword),
                            hintText: Strings.password,
                            textStyle: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          controller.passwordError.value.isNotEmpty
                          ? AnimatedContainer(
                            duration: 100.milliseconds,
                            height: controller.passwordError.value.isEmpty ? 0 : 30.0,
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              controller.passwordError.value,
                              style: const TextStyle(
                                color: CustomColors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ) 
                          : const SizedBox.shrink(),
                          controller.errorMessage.value.isNotEmpty
                          ? AnimatedContainer(
                            duration: 100.milliseconds,
                            height: controller.errorMessage.value.isEmpty ? 0 : 30.0,
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              controller.errorMessage.value,
                              style: const TextStyle(
                                color: CustomColors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ) 
                          : const SizedBox.shrink(),
                          const SizedBox(height: Dimensions.regularSpacing),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RememberMe(
                                isChecked: controller.setIsRememberMe,
                                title: "Remember Me",
                              ),
                              // GestureDetector(
                              //   onTap: () => printUtil("Forgot Password"),
                              //   child: const Text(
                              //     "Forgot Password?",
                              //     style: TextStyle(
                              //       fontSize: 14,
                              //       color: CustomColors.primaryColor,
                              //       fontWeight: FontWeight.w400,
                              //       decoration: TextDecoration.underline
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                          const SizedBox(height: Dimensions.textFieldHeight),
                          SizedBox(
                            height: 60,
                            width: Get.width,
                            child: ElevatedButton(
                              onPressed: () => controller.login(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                elevation: 0
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}