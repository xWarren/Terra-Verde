import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/domain/services/storage_service.dart';
import '../../core/routes/routes.dart';
import '../../core/utils/print_utils.dart';

class LoginController extends GetxController {
  
  LoginController({
    required this.storageService,
  });
  
  final StorageService storageService;
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxString emailError = "".obs;
  RxString passwordError = "".obs;

  final emailRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  RxBool isFieldFilled = false.obs;

  void dismissKeyboard() => Get.focusScope?.unfocus();

  void setIsRememberMe(bool isChecked) {
    storageService.setIsRemember(isChecked);
  }

  void goToRegister() {
    textRefresh();
    clearErrors();
    Get.toNamed(Routes.registerRoute);
  }

  void textRefresh() {
    emailController.text = "";
    passwordController.text = "";
  }

  void clearErrors() {
    emailError.value = "";
    passwordError.value = "";
    update();
  }

  void login() {
    
    var email = emailController.text;
    var password = passwordController.text;
    
    clearErrors();

    bool hasErrors = false;

    if (email.isEmpty) {
      emailError("Enter your email");
      hasErrors = true;
    } else if (!emailRegExp.hasMatch(email.trim())) {
      emailError("Your email is invalid");
      hasErrors = true;
    } if (password.isEmpty) {
      passwordError("Enter your password");
      hasErrors = true;
    } if (!hasErrors) {
      printUtil("Welcome");
      Get.offAndToNamed(Routes.dashboardRoute);
    }
  }
}