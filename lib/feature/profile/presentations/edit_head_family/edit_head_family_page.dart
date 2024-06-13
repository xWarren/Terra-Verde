import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/common/common_text_field.dart';
import '../../../../core/presentation/custom/custom_back_button.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';
import '../../../../core/resources/strings.dart';
import 'edit_head_family_controller.dart';
class EditHeadFamilyPage extends GetView<EditHeadFamilyController> {
  const EditHeadFamilyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.dismissKeyboard(),
      child: Scaffold(
        backgroundColor: CustomColors.grey200,
          appBar: AppBar(
            backgroundColor: CustomColors.white,
            elevation: 0,
            leading: const CustomBackButton(),
            title: const Text(
              "Edit Profile",
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
        body: GetBuilder<EditHeadFamilyController>(
          builder: (context) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15, 
                          vertical: 20
                        ),
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
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: Dimensions.extraLargeSpacing),
                               SizedBox(
                                height: 50,
                                width: Get.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.getImageFromGallery();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    elevation: 0
                                  ),
                                  child: const Text(
                                    "Upload Photo",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: Dimensions.regularSpacing),
                              const Text(
                                Strings.firstName,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              CommonTextField(
                                controller: controller.firstNameController,
                                errorText: controller.firstNameError.value,
                                maxLines: 1,
                                textInputAction: TextInputAction.next,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, 
                                  vertical: 10
                                ),
                                onChanged: (value) {
                                  controller.isFieldFilled.value = value.isNotEmpty;
                                  controller.firstNameError.value = "";
                                  controller.update();
                                },
                                hintText: Strings.firstName,
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              controller.firstNameError.value.isNotEmpty
                              ? AnimatedContainer(
                                duration: 100.milliseconds,
                                height: controller.firstNameError.value.isEmpty ? 0 : 30.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.firstNameError.value,
                                  style: const TextStyle(
                                    color: CustomColors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ) 
                              : const SizedBox.shrink(),
                              const SizedBox(height: Dimensions.regularSpacing),
                              const Text(
                                Strings.lastName,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              CommonTextField(
                                controller: controller.lastNameController,
                                errorText: controller.lastNameError.value,
                                maxLines: 1,
                                textInputAction: TextInputAction.next,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, 
                                  vertical: 10
                                ),
                                onChanged: (value) {
                                  controller.isFieldFilled.value = value.isNotEmpty;
                                  controller.lastNameError.value = "";
                                  controller.update();
                                },
                                hintText: Strings.lastName,
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              controller.lastNameError.value.isNotEmpty
                              ? AnimatedContainer(
                                duration: 100.milliseconds,
                                height: controller.lastNameError.value.isEmpty ? 0 : 30.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.lastNameError.value,
                                  style: const TextStyle(
                                    color: CustomColors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ) 
                              : const SizedBox.shrink(),
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
                                errorText: controller.addressError.value,
                                maxLines: 1,
                                textInputAction: TextInputAction.next,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, 
                                  vertical: 10
                                ),
                                onChanged: (value) {
                                  controller.isFieldFilled.value = value.isNotEmpty;
                                  controller.addressError.value = "";
                                  controller.update();
                                },
                                hintText: Strings.address,
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              controller.addressError.value.isNotEmpty
                              ? AnimatedContainer(
                                duration: 100.milliseconds,
                                height: controller.addressError.value.isEmpty ? 0 : 30.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.addressError.value,
                                  style: const TextStyle(
                                    color: CustomColors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ) 
                              : const SizedBox.shrink(),
                              const SizedBox(height: Dimensions.regularSpacing),
                              const Text(
                                Strings.email,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              CommonTextField(
                                controller: controller.emailController,
                                errorText: controller.emailError.value,
                                maxLines: 1,
                                readOnly: true,
                                textInputAction: TextInputAction.next,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, 
                                  vertical: 10
                                ),
                                onChanged: (value) {
                                  controller.isFieldFilled.value = value.isNotEmpty;
                                  controller.emailError.value = "";
                                  controller.update();
                                },
                                hintText: Strings.email,
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              controller.emailError.value.isNotEmpty
                              ? AnimatedContainer(
                                duration: 100.milliseconds,
                                height: controller.emailError.value.isEmpty ? 0 : 30.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.emailError.value,
                                  style: const TextStyle(
                                    color: CustomColors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ) 
                              : const SizedBox.shrink(),
                              const SizedBox(height: Dimensions.textFieldHeight),
                              SizedBox(
                                height: 50,
                                width: Get.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.editProfile(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    elevation: 0
                                  ),
                                  child: const Text(
                                    "Update",
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
                        )
                      ),
                    )
                  ],
                );
              }
            );
          }
        ),
      ),
    );
  }
}