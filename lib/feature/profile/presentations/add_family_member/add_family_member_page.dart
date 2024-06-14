import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/common/common_text_field.dart';
import '../../../../core/presentation/custom/custom_back_button.dart';
import '../../../../core/presentation/custom/custom_dropdown.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';
import '../../../../core/resources/strings.dart';
import 'add_family_member_controller.dart';

class AddFamilyMemberPage extends GetView<AddFamilyMemberController> {
  const AddFamilyMemberPage({super.key});

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
        body: GetBuilder<AddFamilyMemberController>(
          builder: (context) {
            String base64String = controller.profileImage.split(',').last;
            List<int> bytes = base64.decode(base64String);
            Uint8List imageData = Uint8List.fromList(bytes);
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
                              Center(
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Obx(
                                      () => ClipRRect(
                                        borderRadius: BorderRadius.circular(99),
                                        child: 
                                        controller.fileImage.value != null
                                        ? Image.file(
                                        controller.fileImage.call()!,
                                        fit: BoxFit.fill,
                                        height: 120,
                                        width: 120
                                        )
                                        : imageData.isNotEmpty
                                        ? Image.memory(
                                          imageData,
                                          height: 120,
                                          width: 120,
                                        )
                                        : Image.asset(
                                          Assets.noImage,
                                          height: 120,
                                          width: 120,
                                        )
                                      ),
                                    ),
                                    GestureDetector(
                                    onTap: () {
                                      controller.getImageFromGallery();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey.shade200,
                                      radius: 17,
                                      child: const Icon(
                                        Icons.edit,
                                        color: CustomColors.primaryColor,
                                        size: 24,
                                      )
                                    ),
                                  )
                                  ]
                                )
                              ),
                              controller.imageError.value.isNotEmpty
                              ? AnimatedContainer(
                                duration: 100.milliseconds,
                                height: controller.imageError.value.isEmpty ? 0 : 30.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Text(
                                    controller.imageError.value,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: CustomColors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ) 
                              : const SizedBox.shrink(),
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
                                Strings.middleName,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              CommonTextField(
                                controller: controller.middleNameController,
                                errorText: controller.middleNameError.value,
                                maxLines: 1,
                                textInputAction: TextInputAction.next,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, 
                                  vertical: 10
                                ),
                                onChanged: (value) {
                                  controller.isFieldFilled.value = value.isNotEmpty;
                                  controller.middleNameError.value = "";
                                  controller.update();
                                }, 
                                hintText: Strings.middleName,
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              controller.middleNameError.value.isNotEmpty
                              ? AnimatedContainer(
                                duration: 100.milliseconds,
                                height: controller.middleNameError.value.isEmpty ? 0 : 30.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.middleNameError.value,
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
                                Strings.birthday,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1901),
                                    lastDate: DateTime.now()
                                  );
                                  if (pickedDate != null) {
                                    String formattedDate = DateFormat('yyyy-dd-MM').format(pickedDate);
                                    controller.birthdayError.value = "";
                                    controller.birthday.value = formattedDate;
                                    DateTime announcementDate = DateTime.parse(controller.birthday.value);
                                    DateFormat monthFormat = DateFormat('MMMM dd, yyyy');
                                    controller.birthDate.value = monthFormat.format(announcementDate);
                                  }
                                    controller.birthday.value;
                                    controller.update();
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 45,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20, 
                                    vertical: 10
                                  ),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: controller.birthdayError.value.isNotEmpty
                                        ? CustomColors.red
                                        : CustomColors.grey100,
                                        width: 1
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            controller.birthday.value.isEmpty 
                                            ? "MM/DD/YYYY"    
                                            : controller.birthDate.value,
                                            style: TextStyle(
                                              color: controller.birthday.value.isEmpty
                                              ? CustomColors.grey  
                                              : CustomColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Image.asset(
                                          Assets.icDown, 
                                          height: 10, 
                                          width: 10
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              controller.birthdayError.value.isNotEmpty
                              ? AnimatedContainer(
                                duration: 100.milliseconds,
                                height: controller.birthdayError.value.isEmpty ? 0 : 30.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.birthdayError.value,
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
                                Strings.mobileNumber,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              CommonTextField(
                                controller: controller.phoneNumberController,
                                errorText: controller.phoneNumberError.value,
                                maxLines: 1,
                                inputFormatters: [LengthLimitingTextInputFormatter(9)],
                                textInputAction: TextInputAction.next,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, 
                                  vertical: 10
                                ),
                                onChanged: (value) {
                                  controller.isFieldFilled.value = value.isNotEmpty;
                                  controller.phoneNumberError.value = "";
                                  controller.update();
                                },
                                hintText: Strings.mobileNumber,
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              controller.phoneNumberError.value.isNotEmpty
                              ? AnimatedContainer(
                                duration: 100.milliseconds,
                                height: controller.phoneNumberError.value.isEmpty ? 0 : 30.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.phoneNumberError.value,
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
                                Strings.gender,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: CustomDropdown<String>(
                                  errorMessage: controller.genderError.value, 
                                  onChange: (String value, int index) {
                                      controller.gender.value = value;
                                      controller.genderError.value = "";
                                      controller.update();
                                  },
                                  dropdownStyle: DropdownStyle(
                                    borderRadius: BorderRadius.circular(5),
                                    elevation: 1,
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  ),
                                  items: controller.genderList.map((String value) {
                                    return DropdownItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5, 
                                          vertical: 10
                                        ),
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            color: CustomColors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2, 
                                      vertical: 10
                                    ),
                                    child: Text(
                                      controller.gender.value.isEmpty 
                                      ? Strings.gender 
                                      : controller.gender.value,
                                      style: TextStyle(
                                        color: controller.gender.value.isEmpty 
                                        ? Colors.grey.shade400 
                                        : Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              controller.genderError.value.isNotEmpty
                              ? AnimatedContainer(
                                duration: 100.milliseconds,
                                height: controller.genderError.value.isEmpty ? 0 : 30.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.genderError.value,
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
                                Strings.familyRelationship,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: CustomDropdown<String>(
                                  errorMessage: controller.relationshipError.value, 
                                  onChange: (String value, int index) {
                                      controller.relationship.value = value;
                                      controller.relationshipError.value = "";
                                      controller.update();
                                  },
                                  dropdownStyle: DropdownStyle(
                                    borderRadius: BorderRadius.circular(5),
                                    elevation: 1,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15, 
                                      vertical: 10
                                    ),
                                  ),
                                  items: controller.familyRelationshipList.map((String value) {
                                    return DropdownItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5, 
                                          vertical: 10
                                        ),
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            color: CustomColors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                                    child: Text(
                                      controller.relationship.value.isEmpty 
                                      ? Strings.familyRelationship 
                                      : controller.relationship.value,
                                      style: TextStyle(
                                        color: controller.relationship.value.isEmpty 
                                        ? Colors.grey.shade400 
                                        : Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              controller.relationshipError.value.isNotEmpty
                              ? AnimatedContainer(
                                duration: 100.milliseconds,
                                height: controller.relationshipError.value.isEmpty ? 0 : 30.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.relationshipError.value,
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
                              const SizedBox(height: Dimensions.regularSpacing),
                              const Text(
                                Strings.password,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              CommonTextField(
                                controller: controller.passwordController,
                                errorText: controller.passwordError.value,
                                maxLines: 1,
                                isSecure: true,
                                hasShowHideTextIcon: true,
                                textInputAction: TextInputAction.next,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, 
                                  vertical: 10
                                ),
                                onChanged: (value) {
                                  controller.isFieldFilled.value = value.isNotEmpty;
                                  controller.passwordError.value = "";
                                },
                                hintText: Strings.password,
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              controller.passwordError.value.isNotEmpty
                              ? AnimatedContainer(
                                duration: 100.milliseconds,
                                height: controller.passwordError.value.isEmpty ? 0 : 30.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.passwordError.value,
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
                                Strings.confirmPassword,
                                style: TextStyle(
                                  color: CustomColors.grey400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              CommonTextField(
                                controller: controller.confirmPasswordController,
                                errorText: controller.confirmPasswordError.value,
                                maxLines: 1,
                                isSecure: true,
                                hasShowHideTextIcon: true,
                                textInputAction: TextInputAction.done,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, 
                                  vertical: 10
                                ),
                                onChanged: (value) {
                                  controller.isFieldFilled.value = value.isNotEmpty;
                                  controller.confirmPasswordError.value = "";
                                  controller.update();
                                },
                                hintText: Strings.confirmPassword,
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              controller.confirmPasswordError.value.isNotEmpty
                              ? AnimatedContainer(
                                duration: 100.milliseconds,
                                height: controller.confirmPasswordError.value.isEmpty ? 0 : 30.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.confirmPasswordError.value,
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
                                  onPressed: () => controller.addFamilyMember(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    elevation: 0
                                  ),
                                  child: const Text(
                                    "Add",
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