import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/custom/custom_back_button.dart';
import '../../../../core/resources/custom_colors.dart';
import 'add_family_member_controller.dart';

class AddFamilyMemberPage extends GetView<AddFamilyMemberController> {
  const AddFamilyMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey200,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        elevation: 0,
        leading: const CustomBackButton(),
        title: const Text(
          "Add Family Member",
          style: TextStyle(
            color: CustomColors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: CustomColors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: Get.height,
              width: Get.width,
              margin: const EdgeInsets.only(top: 20),
              decoration: const ShapeDecoration(
                color: CustomColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  )
                )
              ),
              child: const Text("Hello"),
            ),
          )
        ],
      ),
    );
  }
}