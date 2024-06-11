import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/domain/services/storage_service.dart';
import '../../../core/domain/usecases/login_usecase.dart';
import '../../../core/routes/routes.dart';
import '../../../core/utils/print_utils.dart';
import '_components/email_section.dart';
import '_components/password_section.dart';

class LoginController extends GetxController {
  
  LoginController({
    required this.storageService,
    required this.loginUseCase
  });
  
  final StorageService storageService;

  final LoginUseCase loginUseCase;
  StreamSubscription? loginSubs;

  RxBool isHeadOfTheFamily = false.obs;

  RxString errorMessage = "".obs;

  final emailRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  RxBool isLoading = false.obs;

  GlobalKey<EmailSectionState> emailKey = GlobalKey<EmailSectionState>();
  GlobalKey<PasswordSectionState> passwordKey = GlobalKey<PasswordSectionState>();

  void dismissKeyboard() => Get.focusScope?.unfocus();

  void setIsRememberMe(bool isChecked) {
    storageService.setIsRemember(isChecked);
  }

  @override
  void onInit() {
    storageService.setMember(Get.arguments['isHeadOfTheFamily']);
    printUtil("HEAD OF THE FAMILY: ${storageService.isHeadFamily().toString()}");
    super.onInit();
  }

  void goToRegister() {
    textRefresh();
    clearErrors();
    Get.toNamed(Routes.registerRoute);
    
  }

  void textRefresh() {
    emailKey.currentState?.controller.text = "";
    passwordKey.currentState?.controller.text = "";
  }

  void clearErrors() {
    emailKey.currentState?.emailError = "";
    passwordKey.currentState?.passwordError = "";
    errorMessage.value = "";
    update();
  }

  void login() {
    
    var email = emailKey.currentState?.controller.text;
    var password = passwordKey.currentState?.controller.text;
    clearErrors();

    bool hasErrors = false;

    if (email.toString().isEmpty) {
       emailKey.currentState?.emailErrorMessage("Enter your email");
      hasErrors = true;
    } else if (!emailRegExp.hasMatch(email.toString().trim())) {
      emailKey.currentState?.emailErrorMessage("Your email is invalid");
      hasErrors = true;
    } if (password.toString().isEmpty) {
      passwordKey.currentState?.passwordErrorMessage("Enter your password");
      hasErrors = true;
    } if (!hasErrors) {
      isLoading(true);
       passwordKey.currentState?.setLoading(true);
      emailKey.currentState?.setLoading(true);
      loginSubs?.cancel();
      loginSubs = loginUseCase.execute(
        email: email.toString(), 
        password: password.toString()
      ).asStream().listen((value) {
        storageService.setLoggedIn(true);
        storageService.saveAccessToken(value.token);
        storageService.setEmail(value.userName);
        storageService.setPassword(password.toString());
        storageService.setResidentId(value.residentId.toString());
        Get.offNamedUntil(Routes.dashboardRoute, (route) => false);
        isLoading(false);
        passwordKey.currentState?.setLoading(false);
        emailKey.currentState?.setLoading(false);
        update();
      },
      onError: (error) {
        printUtil("loginErr: $error");
        passwordKey.currentState?.passwordError.isNotEmpty;
        errorMessage.value = error.toString();
        isLoading(false);
        passwordKey.currentState?.setLoading(false);
        emailKey.currentState?.setLoading(false);
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