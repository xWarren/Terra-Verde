import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/domain/services/storage_service.dart';

class LoginController extends GetxController {
  
  LoginController({
    required this.storageService,
  });
  
  final StorageService storageService;
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dismissKeyboard() => Get.focusScope?.unfocus();

  void setIsRememberMe(bool isChecked) {
    storageService.setIsRemember(isChecked);
  }
}