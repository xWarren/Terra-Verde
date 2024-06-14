import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/domain/usecases/resident_usecase.dart';
import '../../../../core/presentation/custom/custom_modal.dart';
import '../../../../core/resources/strings.dart';
import '../head_family/head_family_controller.dart';
import '../profile_controller.dart';

class EditHeadFamilyController extends GetxController {

  EditHeadFamilyController({
    required this.storageService,
    required this.residentUseCase,
    required this.headFamilyDelegate,
    required this.profileDelegate
  });

  final StorageService storageService;

  final ResidentUseCase residentUseCase;
  StreamSubscription? _residentSubs;

  
  final HeadFamilyDelegate headFamilyDelegate;
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
  RxString profileImage = "".obs;

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

  RxString imageFile = "".obs;

  Rx<File?> fileImage = Rx<File?>(null);

  final emailRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  void dismissKeyboard() => Get.focusScope?.unfocus();

  @override
  void onInit() {
    id.value = Get.arguments["id"] ?? 0;
    residentId.value = Get.arguments["residentId"] ?? 0;
    firstNameController.text = Get.arguments["firstName"] ?? "";
    lastNameController .text = Get.arguments["lastName"] ?? "";
    addressController .text = Get.arguments["address"] ?? "";
    passwordController.text = storageService.getPassword();
    emailController.text = Get.arguments["email"] ?? "";
    profileImage.value = Get.arguments["profileImage"] ?? "";
    log("ID: ${id.value}");
    log("residentId: ${residentId.value}");
    log("firstNameController: ${firstNameController.text}");
    log("lastNameController: ${lastNameController.text}");
    log("addressController: ${addressController.text}");
    log("passwordController: ${passwordController.text}");
    log("emailController: ${emailController.text}");
    super.onInit();
  }


  void editProfile(BuildContext context) {

    var firstName = firstNameController.text;
    var lastName = lastNameController.text;
    var address = addressController.text;
    var email = emailController.text;
    var password = passwordController.text;

    bool hasErrors = false;

    if (imageFile.isEmpty) {
      imageError.value = "Upload a photo";
      hasErrors = true;
    }

    if (firstName.isEmpty) {
      firstNameError.value = "Enter your first name";
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

    if (email.isEmpty) {
      emailError.value = "Enter your email";
      hasErrors = true;

    } else if (!emailRegExp.hasMatch(email.trim())) {
      emailError.value = "Your email is invalid";
      hasErrors = true;
    }

    if (!hasErrors) {
      _residentSubs?.cancel();
      _residentSubs = residentUseCase.editProfile(
        id: id.value,
        residentId: residentId.value, 
        firstName: firstName, 
        lastName: lastName,
        emailAddress: email,
        address: address, 
        profileImage: imageFile.toString(),
        password: password
      ).asStream().listen((response) {
        log("hllo");
        headFamilyDelegate.getHeadFamily();
        profileDelegate.getHeadFamily();
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
      log("editProfile: $error");
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



  Future getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
     imageFile.value = image.path.toString();
     final imagePermanent = File(image.path);
     fileImage.value = imagePermanent;
     log("eto ba? $imageFile");
  }


  @override
  void onClose() {
    _residentSubs?.cancel();
    super.onClose();
  }
}