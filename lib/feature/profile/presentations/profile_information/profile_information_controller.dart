import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/domain/usecases/residents_use_case.dart';
import '../../../../core/utils/print_utils.dart';

class ProfileInformationController extends GetxController {

  ProfileInformationController({
    required this.residentsUseCase
  });

  final ResidentsUseCase residentsUseCase;
  StreamSubscription? residentsSubs;

  RxInt id = 0.obs;

  RxString image = "".obs;
  RxString firstName = "".obs;
  RxString middeName = "".obs;
  RxString lastName = "".obs;
  RxString familyRelationship = "".obs;

  final birthdayController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final contactNumberController = TextEditingController();

  RxBool isLoading = false.obs;


  @override
  void onInit() {
      
    getResidentsMember();
    printUtil("ID KO DITO${id.value}");
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