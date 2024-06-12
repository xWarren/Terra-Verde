import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/common/common_text_field.dart';
import '../../../../core/presentation/custom/custom_back_button.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';
import '../../../../core/resources/strings.dart';
import 'profile_information_controller.dart';

class ProfileInformationPage extends GetView<ProfileInformationController> {
  const ProfileInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey200,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        elevation: 0,
        leading: const CustomBackButton(),
        title: const Text(
          "Profile Information",
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
      body: GetBuilder<ProfileInformationController>(
        builder: (context) {
          return Column(
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
                  child: controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator(color: CustomColors.primaryColor,))
                  : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 25,
                                top: 25
                              ),
                              padding: const EdgeInsets.all(5),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: CustomColors.grey100),
                                  borderRadius: BorderRadius.circular(99)
                                )
                              ),
                              child: Container(
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: CustomColors.grey100),
                                    borderRadius: BorderRadius.circular(99)
                                  )
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(99),
                                  child: Image.asset(
                                    Assets.logo,
                                    height: 120,
                                    width: 120
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: Dimensions.doubleExtraLargeSpacing),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        controller.firstName.value,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: CustomColors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        controller.middeName.value,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: CustomColors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        controller.lastName.value,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: CustomColors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    controller.familyRelationship.value,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: CustomColors.grey500,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: Color(0xFFD5D5D5),
                          thickness: 1.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: Dimensions.regularSpacing),
                              const Text(
                                Strings.birthday,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              CommonTextField(
                                controller: controller.birthdayController,
                                errorText: "",
                                readOnly: true,
                                maxLines: 1,
                                filled: true,
                                fillColor: const Color(0xFFD9D9D9),
                                contentPadding: const EdgeInsets.only(
                                  left: Dimensions.largeSpacing,
                                  right: Dimensions.largeSpacing,
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: CustomColors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(height: Dimensions.regularSpacing),
                              const Text(
                                Strings.gender,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              CommonTextField(
                                controller: controller.genderController,
                                errorText: "",
                                readOnly: true,
                                maxLines: 1,
                                filled: true,
                                fillColor: const Color(0xFFD9D9D9),
                                contentPadding: const EdgeInsets.only(
                                  left: Dimensions.largeSpacing,
                                  right: Dimensions.largeSpacing,
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: CustomColors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(height: Dimensions.regularSpacing),
                              const Text(
                                Strings.address,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              CommonTextField(
                                controller: controller.addressController,
                                errorText: "",
                                readOnly: true,
                                maxLines: 1,
                                filled: true,
                                fillColor: const Color(0xFFD9D9D9),
                                contentPadding: const EdgeInsets.only(
                                  left: Dimensions.largeSpacing,
                                  right: Dimensions.largeSpacing,
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: CustomColors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(height: Dimensions.regularSpacing),
                              const Text(
                                Strings.mobileNumber,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              CommonTextField(
                                controller: controller.contactNumberController,
                                errorText: "",
                                readOnly: true,
                                maxLines: 1,
                                filled: true,
                                fillColor: const Color(0xFFD9D9D9),
                                contentPadding: const EdgeInsets.only(
                                  left: Dimensions.largeSpacing,
                                  right: Dimensions.largeSpacing,
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: CustomColors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(height: Dimensions.textFieldHeight),
                             if (controller.isHeadFamily.isTrue ||
                              controller.getId.value == controller.id.value.toString()
                             )
                             SizedBox(
                                height: 50,
                                width: Get.width,
                                child: ElevatedButton(
                                  onPressed: () => controller.goToEditProfile(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    elevation: 0
                                  ),
                                  child: const Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}