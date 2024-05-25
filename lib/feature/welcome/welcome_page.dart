import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:terra_verde/core/presentation/common/common_button.dart';

import '../../core/resources/assets.dart';
import '../../core/resources/custom_colors.dart';
import '../../core/resources/dimensions.dart';
import '../../core/resources/strings.dart';
import 'welcome_controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: CustomColors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark
      ),
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.textFieldHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    Assets.logo,
                    height: 161,
                    width: 164,
                  ),
                ),
                const SizedBox(height: Dimensions.extraLargeSpacing),
                const Text(
                  "Welcome to TRIMS Neighbor",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: Dimensions.buttonHeight,
                    bottom: Dimensions.largeSpacing
                  ),
                  child: CommonButton(
                    onPressed: () => controller.goToRegister(),
                    width: Get.width,
                    height: Dimensions.buttonHeight,
                    text: Strings.createAccount,
                    textStyle: const TextStyle(
                      color: CustomColors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      Strings.doYouHaveAnAccount,
                      style: TextStyle(
                        color: CustomColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    const SizedBox(width: Dimensions.smallSpacing),
                    GestureDetector(
                      onTap: () => controller.goToLogin(),
                      child: const Text(
                        Strings.login,
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
          ),
        ),
      ),
    );
  }
}