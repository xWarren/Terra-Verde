import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/presentation/common/common_button.dart';
import '../../core/presentation/common/common_text_field.dart';
import '../../core/resources/assets.dart';
import '../../core/resources/custom_colors.dart';
import '../../core/resources/dimensions.dart';
import '../../core/presentation/custom/custom_back_button.dart';
import '../../core/resources/strings.dart';
import '../../core/routes/routes.dart';
import '../../core/utils/print_utils.dart';
import '_components/remember_me.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.dismissKeyboard(),
      child: Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          elevation: 0,
          leading: const CustomBackButton(),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: CustomColors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [ 
              SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Dimensions.buttonHeight),
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: Dimensions.textFieldHeight),
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
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      contentPadding: const EdgeInsets.only(
                        left: Dimensions.largeSpacing,
                        right: Dimensions.largeSpacing,
                      ),
                      prefixIcon: Image.asset(Assets.icEmail),
                      hintText: Strings.email,
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
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
                      maxLines: 1,
                      isSecure: true,
                      hasShowHideTextIcon: true,
                      textInputAction: TextInputAction.done,
                      contentPadding: const EdgeInsets.only(
                        left: Dimensions.largeSpacing,
                        right: Dimensions.largeSpacing,
                      ),
                      prefixIcon: Image.asset(Assets.icPassword),
                      hintText: Strings.password,
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(height: Dimensions.regularSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RememberMe(isChecked: controller.setIsRememberMe),
                        GestureDetector(
                          onTap: () => printUtil("Forgot Password"),
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 14,
                              color: CustomColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: Dimensions.textFieldHeight),
                    CommonButton(
                      onPressed: () => Get.offAndToNamed(Routes.dashboardRoute),
                      width: Get.width,
                      height: Dimensions.buttonHeight,
                      text: Strings.login,
                      textStyle: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: Dimensions.largeSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          Strings.dontHaveAnAccount,
                          style: TextStyle(
                            color: CustomColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        const SizedBox(width: Dimensions.smallSpacing),
                        GestureDetector(
                          onTap: () => controller.goToRegister(),
                          child: const Text(
                            Strings.signUp,
                            style: TextStyle(
                              color: CustomColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}