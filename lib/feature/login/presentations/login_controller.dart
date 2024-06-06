import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/domain/services/storage_service.dart';
import '../../../core/domain/usecases/login_usecase.dart';
import '../../../core/routes/routes.dart';
import '../../../core/utils/print_utils.dart';

class LoginController extends GetxController {
  
  LoginController({
    required this.storageService,
    required this.loginUseCase
  });
  
  final StorageService storageService;

  final LoginUseCase loginUseCase;
  StreamSubscription? loginSubs;
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isHeadOfTheFamily = false.obs;

  RxString emailError = "".obs;
  RxString passwordError = "".obs;
  RxString errorMessage = "".obs;

  final emailRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  RxBool isLoading = false.obs;
  RxBool isFieldFilled = false.obs;

  void dismissKeyboard() => Get.focusScope?.unfocus();

  void setIsRememberMe(bool isChecked) {
    storageService.setIsRemember(isChecked);
  }

  @override
  void onInit() {
    storageService.setMember(Get.arguments['isHeadOfTheFamily']);
    log("STORAGE: ${storageService.isHeadFamily().toString()}");
    super.onInit();
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
    errorMessage.value = "";
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
      isLoading(true);
      loginSubs?.cancel();
      loginSubs = loginUseCase.execute(email: email, password: password).asStream().listen((value) {
        storageService.setLoggedIn(true);
        storageService.saveAccessToken(value.token);
        Get.offNamedUntil(Routes.dashboardRoute, (route) => false);
        isLoading(false);
      },
      onError: (error) {
        printUtil("loginErr: $error");
        errorMessage.value = error.toString();
        isLoading(false);
        update();
      });
    }
  }


  @override
  void onClose() {
    loginSubs?.cancel();
    super.onClose();
  }
}