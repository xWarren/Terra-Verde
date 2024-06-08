import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/domain/usecases/residents_use_case.dart';
import '../../../../core/utils/print_utils.dart';

class ProfileInformationController extends GetxController {

  ProfileInformationController({
    required this.residentsUseCase,
    required this.storageService
  });

  final ResidentsUseCase residentsUseCase;
  StreamSubscription? residentsSubs;

  final StorageService storageService;

  RxInt id = 0.obs;

  RxString image = "".obs;
  RxString firstName = "".obs;
  RxString middeName = "".obs;
  RxString lastName = "".obs;
  RxString familyRelationship = "".obs;
  RxString email = "".obs;

  final birthdayController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final contactNumberController = TextEditingController();

  RxBool isLoading = false.obs;

  RxBool isHeadFamily = false.obs;

  RxString emailChecker = "".obs;


  @override
  void onInit() {
    isHeadFamily.value = storageService.isHeadFamily();
    emailChecker.value = storageService.getEmail();
    getResidentsMember();
    log("adsad ${emailChecker.value}");
    super.onInit();
  }

  void getResidentsMember() {
    id.value = Get.arguments['id'] ?? 0;
    isLoading(true);

    residentsSubs?.cancel();
    residentsSubs = residentsUseCase.getIdFromResidents(id: id.value).asStream().listen((response) {
      printUtil(response);
      firstName.value = response.firstName;
      middeName.value = response.middleName;
      lastName.value = response.lastName;
      birthdayController.text = response.birthDate;
      genderController.text = response.gender;
      familyRelationship.value = response.relationship;
      contactNumberController.text = response.contactNumber.toString();
      addressController.text = response.address;
      email.value = response.emailAddress;
      isLoading(false);
      update();
    },
    onError: (error) {
      printUtil("getResidentsMember: $error");
      isLoading(false);
      update();
    });
  }
  

  @override
  void onClose() {
    residentsSubs?.cancel();
    super.onClose();
  }
}