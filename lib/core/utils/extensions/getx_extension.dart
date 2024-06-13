import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/common/common_button.dart';
import '../../resources/custom_colors.dart';

extension GetxExtension on GetxController {


  void dismissKeyboard() {
    Get.focusScope?.unfocus();
  }

  void dismissBottomsheet({bool closeOverlays = false}) {
    if (Get.isBottomSheetOpen ?? false) {
      Get.back(closeOverlays: closeOverlays);
    }
  }

  void dismissDialog({bool closeOverlays = false}) {
    if (Get.isDialogOpen ?? false) {
      Get.back(closeOverlays: closeOverlays);
    }
  }

  void showCustomDialog(String title, String content, {VoidCallback? onPressed, VoidCallback? onPressedDelete, String buttonTitle = "dialog close"}) {
    dismissDialog();
    Get.defaultDialog(
      title: title,
      middleText: content,
      radius: 12.0,
      titleStyle: const TextStyle(
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: "Inter"
      ),
      middleTextStyle: const TextStyle(
        fontSize: 15.0,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      actions: [
        CommonButton(
          isLoading: false,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          borderRadius: 10,
          onPressed: onPressed ?? () => Get.back(),
          text: "Cancel",
          backgroundColor: CustomColors.primaryColor,
        ),
        if (onPressedDelete != null) CommonButton(
          isLoading: false,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          borderRadius: 10,
          onPressed: onPressedDelete,
          text: "Yes, delete",
          backgroundColor:CustomColors.red,
        ),
      ],
      barrierDismissible: false
    );
  }
  
  void showLoadingDialog({required String title, required String description}) {
    Get.defaultDialog(
      title: title,
      titleStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.black,
         fontFamily: "Inter"
      ),
      middleText: description,
      middleTextStyle: const TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
        fontFamily: "Inter"
      ),
      titlePadding: const EdgeInsets.only(top: 24.0, right: 24.0, left: 24.0),
      barrierDismissible: false
    );
  }
}