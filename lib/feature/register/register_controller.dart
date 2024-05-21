import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/domain/services/storage_service.dart';

class RegisterController extends GetxController {
  RegisterController({
    required this.storageService,
  });
  
  final StorageService storageService;
  
  final pageController = PageController();

  RxInt registerStep = 0.obs;

  final uniqueCodeController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  RxString birthday = "".obs;
  
  void dismissKeyboard() => Get.focusScope?.unfocus();

  void registerPageChanged(index) {
    registerStep.value = index;
    update();
  }
}