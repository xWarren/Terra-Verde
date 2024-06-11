import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/domain/usecases/resident_house_member_use_case.dart';
import '../../../../core/presentation/custom/custom_modal.dart';
import '../../../../core/resources/strings.dart';
import '../profile_controller.dart';
import '../profile_information/profile_information_controller.dart';

class EditProfileController extends GetxController {

  EditProfileController({
    required this.storageService,
    required this.residentHouseMemberUseCase,
    required this.profileInformationDelegate,
    required this.profileDelegate
  });

  final StorageService storageService;

  final ResidentHouseMemberUseCase residentHouseMemberUseCase;
  StreamSubscription? residentsSubs;
  
  final ProfileInformationDelegate profileInformationDelegate;
  final ProfileDelegate profileDelegate;

  RxInt id = 0.obs;
  RxInt residentId = 0.obs;

  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxString birthday = "".obs;
  RxString gender = "".obs;
  RxString relationship = "".obs;
  
  RxString firstNameError = "".obs;
  RxString middleNameError = "".obs;
  RxString lastNameError = "".obs;
  RxString addressError = "".obs;
  RxString genderError = "".obs;
  RxString relationshipError = "".obs;
  RxString birthdayError = "".obs;
  RxString phoneNumberError = "".obs;
  RxString emailError = "".obs;

  RxString birthDate = "".obs;

  RxBool isFieldFilled = false.obs;
  RxBool isLoading = false.obs;

  RxList<String> genderList = [Strings.male, Strings.female].obs;
  RxList<String> familyRelationshipList = [
    Strings.grandfather, 
    Strings.grandmother,
    Strings.mother,
    Strings.brother, 
    Strings.sister,
    Strings.uncle, 
    Strings.aunt,
    Strings.cousin
  ].obs;

  final emailRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  void dismissKeyboard() => Get.focusScope?.unfocus();

  void editProfile(BuildContext context) {
    var firstName = firstNameController.text;
    var middleName = middleNameController.text;
    var lastName = lastNameController.text;
    var address = addressController.text;
    var phoneNumber = phoneNumberController.text;
    var email = emailController.text;
    var password = passwordController.text;

    bool hasErrors = false;

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

    if (!hasErrors) {
      residentsSubs?.cancel();
      residentsSubs = residentHouseMemberUseCase.editProfile(
        id: id.value,
        residentId: residentId.value, 
        firstName: firstName, 
        middleName: middleName, 
        lastName: lastName, 
        contactNumber: int.parse(phoneNumber), 
        emailAddress: email, 
        address: address, 
        birthDate: birthday.value, 
        gender: gender.value, 
        profileImage: "", 
        relationship: relationship.value, 
        password: password
      ).asStream().listen((response) {
        log("hllo");
        profileInformationDelegate.profileInformation();
        profileDelegate.getResident();
        showModal(
          context: context, 
          title: "Profile Updated Successfully", 
          description: "Your profile details have been updated.", 
          onTap: () => onTap(), 
          buttonText: "Return"
        );
      },
      cancelOnError: true,
      onError: (error) {
      log("getResidentsMember: $error");
      isLoading(false);
      update();
    });
    }
    update();
  }

  void onTap() {
    Get.back();
    Get.back();
  }

  @override
  void onInit() {
    id.value = Get.arguments["id"] ?? 0;
    residentId.value = Get.arguments["residentId"] ?? 0;
    firstNameController.text = Get.arguments["firstName"] ?? "";
    middleNameController .text = Get.arguments["middleName"] ?? "";
    lastNameController .text = Get.arguments["lastName"] ?? "";
    addressController .text = Get.arguments["address"] ?? "";
    phoneNumberController.text = Get.arguments["phoneNumber"] ?? "";
    passwordController.text = storageService.getPassword();
    emailController.text = Get.arguments["email"] ?? "";
    relationship.value = Get.arguments["familyRelationship"] ?? "";
    birthday.value = Get.arguments["birthday"] ?? "";
    gender.value = Get.arguments["gender"] ?? "";
    DateTime announcementDate = DateTime.parse(birthday.value);
    DateFormat monthFormat = DateFormat('MMMM dd, yyyy');
    birthDate.value = monthFormat.format(announcementDate);
    log(birthday.value);
    super.onInit();
  }

  @override
  void onClose() {
    residentsSubs?.cancel();
    super.onClose();
  }
}