import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terra_verde/core/utils/print_utils.dart';

import '../../core/domain/services/storage_service.dart';
import '_components/information_setup.dart';

class RegisterController extends GetxController {
  RegisterController({
    required this.storageService,
  });
  
  final StorageService storageService;
  
  final pageController = PageController();

  RxInt registerStep = 0.obs;

  final uniqueCodeController = TextEditingController();
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  RxString birthday = "".obs;
  
  RxBool isChecked = false.obs;

  final emailRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  GlobalKey<InformationSetupState> informationSetupKey = GlobalKey<InformationSetupState>();
  
  void dismissKeyboard() => Get.focusScope?.unfocus();

  void registerPageChanged(index) {
    registerStep.value = index;
    update();
  }

  void register() {
    var key = informationSetupKey.currentState;

    var uniqueCode = uniqueCodeController.text;
    var firstName = firstNameController.text;
    var middleName = middleNameController.text;
    var lastName = lastNameController.text;
    var address = addressController.text;
    var email = emailController.text;
    var password = passwordController.text;
    var confirmPassword = confirmPasswordController.text;

    key?.clearErrors();

    bool hasErrors = false;

    if (key?.hasUniqueCode == true && uniqueCode.isEmpty) {
      key?.uniqueCodeErrorMessage("Enter your unique code");
      hasErrors = true;
    }

    if (firstName.isEmpty) {
      key?.firstNameErrorMessage("Enter your first name");
      hasErrors = true;
    }

    if (middleName.isEmpty) {
      key?.middleNameErrorMessage("Enter your middle name");
      hasErrors = true;
    }

    if (lastName.isEmpty) {
      key?.lastNameErrorMessage("Enter your last name");
      hasErrors = true;
    }

    if (address.isEmpty) {
      key?.addressErrorMessage("Enter your address");
      hasErrors = true;
    }

    if (key?.gender.toString().isEmpty == true) {
      key?.genderErrorMessage("Select your gender");
      hasErrors = true;
    }

    if (key?.birthday.toString().isEmpty == true) {
      key?.birthdayErrorMessage("Enter your birthday");
      hasErrors = true;
    }

    if (email.isEmpty) {
      key?.emailErrorMessage("Enter your email");
      hasErrors = true;

    } else if (!emailRegExp.hasMatch(email.trim())) {
      key?.emailErrorMessage("Your email is invalid");
      hasErrors = true;
    }

    if (password.isEmpty) {
      key?.passwordErrorMessage("Enter your password");
      hasErrors = true;
    }

    if (confirmPassword.isEmpty) {
      key?.confirmPasswordErrorMessage("Enter your confirm password");
      hasErrors = true;
    } 

    if (password.isNotEmpty && confirmPassword.isNotEmpty && password != confirmPassword) {
      key?.confirmPasswordErrorMessage("Passwords do not match");
      hasErrors = true;
    }

    if (!hasErrors) {
      printUtil("ok na");
    }
  }
}