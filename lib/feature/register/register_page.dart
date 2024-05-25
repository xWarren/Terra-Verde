import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/presentation/common/common_button.dart';
import '../../core/presentation/custom/custom_back_button.dart';
import '../../core/presentation/custom/custom_expandable_.pageview.dart';
import '../../core/resources/custom_colors.dart';
import '../../core/resources/dimensions.dart';
import '../../core/resources/strings.dart';
import '_components/information_setup.dart';
import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    var registerLength = <Widget> [
      GetBuilder<RegisterController>(
        builder: (controller) {
          return InformationSetup(
            key: controller.informationSetupKey,
            uniqueCodeController: controller.uniqueCodeController, 
            firstNameController: controller.firstNameController,
            middleNameController: controller.middleNameController,
            lastNameController: controller.lastNameController, 
            addressController: controller.addressController, 
            phoneNumberController: controller.phoneNumberController, 
            birthday: controller.birthday.value, 
            emailController: controller.emailController, 
            passwordController: controller.passwordController, 
            confirmPasswordController: controller.confirmPasswordController
          );
        },
      )
    ];

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
                    const Center(
                      child: Text(
                        Strings.createAccount,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    ExpandablePageView.builder(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) =>controller.registerPageChanged(index),
                      itemCount: registerLength.length,
                      itemBuilder: (p0, index) {
                        return registerLength[index];
                      },
                    ),
                    const SizedBox(height: Dimensions.textFieldHeight),
                    CommonButton(
                      onPressed: () { 
                        controller.register();
                      },
                      width: Get.width,
                      height: Dimensions.buttonHeight,
                      text: Strings.register,
                      textStyle: const TextStyle(
                        color: CustomColors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    const SizedBox(height: Dimensions.largeSpacing),
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