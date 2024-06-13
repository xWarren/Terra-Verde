import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/domain/usecases/resident_usecase.dart';
import '../../../../core/routes/routes.dart';

abstract class HeadFamilyDelegate {

  void getHeadFamily();
}
class HeadFamilyController extends GetxController implements HeadFamilyDelegate {
  HeadFamilyController({
    required this.storageService,
    required this.residentUseCase
  });
  
  final StorageService storageService;

  final ResidentUseCase residentUseCase;
  StreamSubscription? _residentSubs;

  RxBool isLoading = false.obs;

  String get getResidentId => storageService.getResidentId();

  bool get isHeadFamily => storageService.isHeadFamily();
  
  RxInt id = 0.obs;
  RxInt residentId = 0.obs;

  String profileImage = "";
  RxString firstName = "".obs;
  RxString middeName = "".obs;
  RxString lastName = "".obs;
  RxString familyRelationship = "".obs;
  RxString email = "".obs;
  RxString birthday = "".obs;

  final birthdayController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final contactNumberController = TextEditingController();




  @override
  void onInit() {
    headFamily();
    super.onInit();
  }


  void headFamily() {
    id.value = Get.arguments['id'] ?? 0;
    isLoading(true);
    
    _residentSubs?.cancel();

    _residentSubs = residentUseCase.getResident(id: id.value).asStream().listen((response) {
      
      id(response.id);
      residentId(int.parse(response.residentId));
      firstName(response.firstName);
      profileImage = response.profileImage;
      lastName(response.lastName);
      email(response.email);
      genderController.text = "N/A";
      familyRelationship("Head of the Family");
      contactNumberController.text = "N/A";
      birthdayController.text = "N/A";
      addressController.text = response.address;
      id(response.id);
      isLoading(false);
      update();
    },
    cancelOnError: true,
    onError: (error) {
      log("headFamilyErr = $error");
      isLoading(false);
    });
  }

  void goToEditProfile() {
    Get.toNamed(
      Routes.editHeadFamilyRoute,
      arguments: {
        "id": id.value,
        "residentId": residentId.value,
        "firstName": firstName.value,
        "lastName": lastName.value,
        "address": addressController.text,
        "email": email.value
      }
    );
  }

  @override
  void onClose() {
    _residentSubs?.cancel();
    super.onClose();
  }
  
  @override
  void getHeadFamily() {
    headFamily();
  }
}