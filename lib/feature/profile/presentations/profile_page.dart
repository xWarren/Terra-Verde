import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/presentation/custom/custom_back_button.dart';
import '../../../core/resources/custom_colors.dart';
import '../../../core/resources/dimensions.dart';
import '../../../core/routes/routes.dart';
import '_components/family_member_section.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        elevation: 0,
        leading: const CustomBackButton(),
        title: const Text(
          "Profile",
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
      body: GetBuilder<ProfileController>(
        builder: (context) {
          return Container(
            color: Colors.grey.shade300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FamilyMemberSection(
                  residentsData: controller.residentsData,
                ),
                if(controller.isHeadFamily.isTrue)
                Container(
                  color: CustomColors.white,
                  child: Container(
                    height: 50,
                    width: Get.width,
                    color: CustomColors.white,
                    margin: const EdgeInsets.symmetric(
                      horizontal: Dimensions.extraLargeSpacing,
                      vertical: Dimensions.extraLargeSpacing
                    ),
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed(
                        Routes.addFamilyMemberRoute,
                        arguments: {
                          "residentId": controller.residentId.value
                        }
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        elevation: 0
                      ),
                      child: const Text(
                        "Add Family Member",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}