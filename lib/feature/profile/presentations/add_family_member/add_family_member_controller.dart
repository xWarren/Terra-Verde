import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/strings.dart';
import '../../../../core/utils/print_utils.dart';

class AddFamilyMemberController extends GetxController {

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
  RxString gender = "".obs;
  RxString relationship = "".obs;

  RxString uniqueCodeError = "".obs;
  RxString firstNameError = "".obs;
  RxString middleNameError = "".obs;
  RxString lastNameError = "".obs;
  RxString addressError = "".obs;
  RxString genderError = "".obs;
  RxString relationshipError = "".obs;
  RxString birthdayError = "".obs;
  RxString phoneNumberError = "".obs;
  RxString emailError = "".obs;
  RxString passwordError = "".obs;
  RxString confirmPasswordError = "".obs;

  RxBool isFieldFilled = false.obs;
  RxBool isLoading = false.obs;

  RxList<String> genderList = [Strings.male, Strings.female].obs;
  RxList<String> familyRelationshipList = [
    Strings.grandfather, 
    Strings.grandmother,
    Strings.headofthefamily, 
    Strings.mother,
    Strings.brother, 
    Strings.sister,
    Strings.uncle, 
    Strings.aunt,
    Strings.cousin
  ].obs;

  final emailRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  
  void dismissKeyboard() => Get.focusScope?.unfocus();
  
  void addFamilyMember() {
    var uniqueCode = uniqueCodeController.text;
    var firstName = firstNameController.text;
    var middleName = middleNameController.text;
    var lastName = lastNameController.text;
    var address = addressController.text;
    var phoneNumber = phoneNumberController.text;
    var email = emailController.text;
    var password = passwordController.text;
    var confirmPassword = confirmPasswordController.text;

    bool hasErrors = false;

    if (uniqueCode.isEmpty) {
      uniqueCodeError.value = "Enter your unique code";
      hasErrors = true;
    }

    if (firstName.isEmpty) {
      firstNameError.value = "Enter your first name";
      hasErrors = true;
    }

    if (middleName.isEmpty) {
      middleNameError.value = "Enter your middle name";
      hasErrors = true;
    }

    if (lastName.isEmpty) {
      lastNameError.value = "Enter your last name";
      hasErrors = true;
    }

    if (address.isEmpty) {
      addressError.value = "Enter your address";
      hasErrors = true;
    }

    if (phoneNumber.isEmpty == true) {
      phoneNumberError.value = "Enter your contact number";
      hasErrors = true;
    }

    if (gender.value.isEmpty == true) {
      genderError.value = "Select your gender";
      hasErrors = true;
    }

    if (relationship.value.isEmpty == true) {
      relationshipError.value = "Select your relationship";
      hasErrors = true;
    }

    if (birthday.value.isEmpty == true) {
      birthdayError.value = "Enter your birthday";
      hasErrors = true;
    }

    if (email.isEmpty) {
      emailError.value = "Enter your email";
      hasErrors = true;

    } else if (!emailRegExp.hasMatch(email.trim())) {
      emailError.value = "Your email is invalid";
      hasErrors = true;
    }

    if (password.isEmpty) {
      passwordError.value = "Enter your password";
      hasErrors = true;
    }

    if (confirmPassword.isEmpty) {
      confirmPasswordError.value = "Enter your confirm password";
      hasErrors = true;
    } 

    if (password.isNotEmpty && confirmPassword.isNotEmpty && password != confirmPassword) {
      confirmPasswordError.value = "Passwords do not match";
      hasErrors = true;
    }

    if (!hasErrors) {
      printUtil("ok na");
    }
    update();
  }
}