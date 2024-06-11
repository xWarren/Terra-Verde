import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/domain/usecases/resident_house_member_usecase.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/print_utils.dart';

abstract class ProfileInformationDelegate {

  void profileInformation();

}

class ProfileInformationController extends GetxController implements ProfileInformationDelegate {

  ProfileInformationController({
    required this.residentHouseMemberUseCase,
    required this.storageService
  });

  final ResidentHouseMemberUseCase residentHouseMemberUseCase;
  StreamSubscription? residentsSubs;

  final StorageService storageService;

  RxInt id = 0.obs;
  RxInt residentId = 0.obs;

  RxString image = "".obs;
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
    residentsSubs = residentHouseMemberUseCase.getIdFromResidentHouseMember(id: id.value).asStream().listen((response) {
      printUtil(response);
      residentId.value = response.residentId;
      firstName.value = response.firstName;
      middeName.value = response.middleName;
      lastName.value = response.lastName;
      birthday.value = response.birthDate;
      DateTime announcementDate = DateTime.parse(response.birthDate);
      DateFormat monthFormat = DateFormat('MMMM dd, yyyy');
      birthdayController.text = monthFormat.format(announcementDate);
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

  void goToEditProfile() {
    Get.toNamed(
      Routes.editProfileRoute,
      arguments: {
        "id": id.value,
        "residentId": residentId.value,
        "firstName": firstName.value,
        "middleName": middeName.value,
        "lastName": lastName.value,
        "address": addressController.text,
        "phoneNumber": contactNumberController.text,
        "email": email.value,
        "familyRelationship": familyRelationship.value,
        "birthday": birthday.value,
        "gender": genderController.text,
      }
    );
  }
  

  @override
  void onClose() {
    residentsSubs?.cancel();
    super.onClose();
  }
  
  @override
  void profileInformation() {
    getResidentsMember();
    update();
  }
}