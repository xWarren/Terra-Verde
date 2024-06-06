import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/presentation/common/common_loading.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/custom_colors.dart';
import '../../../core/resources/dimensions.dart';
import '_components/email_section.dart';
import '_components/password_section.dart';
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
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: CustomColors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark
          ),
          leading: GestureDetector(
            onTap:  () => Get.back(),
            child: Image.asset(
              Assets.icArrowLeft
            ),
          ),
        ),
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
                          child: Image.asset(
                            Assets.logo,
                            height: 161,
                            width: 164,
                          ),
                        ),
                        GetBuilder<LoginController>(
                          builder: (context) {
                            return EmailSection(
                              key: controller.emailKey
                            );
                          },
                        ),
                        GetBuilder<LoginController>(
                          builder: (context) {
                            return PasswordSection(
                              key: controller.passwordKey
                            );
                          }
                        ),
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
                        const SizedBox(height: Dimensions.textFieldHeight),
                        SizedBox(
                          height: 50,
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: controller.isLoading.value 
                            ? null
                            : () => controller.login(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 0
                            ),
                            child: controller.isLoading.value
                            ? const CommonLoading()
                            : const Text(
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
    );
  }
}