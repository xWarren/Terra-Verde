import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/domain/usecases/resident_house_member_usecase.dart';
import '../../../../core/presentation/custom/custom_modal.dart';
import '../../../../core/resources/strings.dart';
import '../profile_controller.dart';

class AddFamilyMemberController extends GetxController {

  AddFamilyMemberController({
    required this.residentHouseMemberUseCase,
    required this.profileDelegate
  });

  final ResidentHouseMemberUseCase residentHouseMemberUseCase;
  StreamSubscription? residentsSubs;

  final ProfileDelegate profileDelegate;

  RxInt residentId = 0.obs;

  RxString emailChecker = "".obs;
  RxString imageFile = "".obs;

  Rx<File?> fileImage = Rx<File?>(null);

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
  RxString profileImage = "".obs;
  
  RxString imageError = "".obs;
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


  @override
  void onInit() {
    residentId.value = Get.arguments['residentId'];
    log(residentId.value.toString());
    super.onInit();
  }

  
  void dismissKeyboard() => Get.focusScope?.unfocus();
  
  void addFamilyMember(BuildContext context) {
    var firstName = firstNameController.text;
    var middleName = middleNameController.text;
    var lastName = lastNameController.text;
    var address = addressController.text;
    var phoneNumber = phoneNumberController.text;
    var email = emailController.text;
    var password = passwordController.text;
    var confirmPassword = confirmPasswordController.text;

    bool hasErrors = false;

    if (imageFile.isEmpty) {
      imageError.value = "Upload a photo";
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
      residentsSubs?.cancel();
      residentsSubs = residentHouseMemberUseCase.addResidentHouseMember(
        residentId: residentId.value, 
        firstName: firstName, 
        middleName: middleName, 
        lastName: lastName, 
        contactNumber: int.parse(phoneNumber), 
        emailAddress: email, 
        address: address, 
        birthDate: birthday.value, 
        gender: gender.value, 
        profileImage: imageFile.toString(),
        relationship: relationship.value, 
        password: password
      ).asStream().listen((response) {
        log("PROFILE IMAGE:${imageFile.toString()}");
        showModal(
          context: context, 
          title: "Family Member Added Successfully", 
          description: "The family member has been added to your profile.", 
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
    profileDelegate.getResident();
    Get.back();
    Get.back();
  }

  Future getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
     imageFile.value = image.path.toString();
     final imagePermanent = File(image.path);
     fileImage.value = imagePermanent;
  }

  String convertToBase64String(File? file) {
    if (file != null) {
      List<int> imageBytes = file.readAsBytesSync();
      return base64Encode(imageBytes);
    } else {
    return "";
    }
  }

  @override
  void onClose() {
    residentsSubs?.cancel();
    super.onClose();
  }
}