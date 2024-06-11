import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';

import '../../../core/domain/entities/resident_house_member_data_entity.dart';
import '../../../core/domain/services/storage_service.dart';
import '../../../core/domain/usecases/resident_house_member_use_case.dart';
import '../../../core/utils/print_utils.dart';

abstract class ProfileDelegate {
  void getResident();
}

class ProfileController extends GetxController implements ProfileDelegate {

  ProfileController({
    required this.storageService,
    required this.residentHouseMemberUseCase
  });

  final StorageService storageService;

  final ResidentHouseMemberUseCase residentHouseMemberUseCase;
  StreamSubscription? residentsSubs;
  
  RxList<ResidentHouseMemberDataEntity> residentsData = <ResidentHouseMemberDataEntity>[].obs;

  RxInt residentId = 0.obs;

  RxBool isLoading = false.obs;

  RxString firstName = "".obs;
  RxString middleName = "".obs;
  RxString lastName = "".obs;
  RxString familyRelationship = "".obs;

  RxInt id = 0.obs;

  RxBool isHeadFamily = false.obs;

  @override
  void onInit() {
    getResidentsMember();
    isHeadFamily.value = storageService.isHeadFamily();
    printUtil("hello");
    super.onInit();
  }

  void getResidentsMember() {
    isLoading(true);

    residentsSubs?.cancel();
    residentsSubs = residentHouseMemberUseCase.getResidentHouseMember().asStream().listen((response) {
      for (var item in response ) {
        residentId.value = item.residentId;
      }
      residentsData.assignAll(response);
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
  
  @override
  void getResident() {
    getResidentsMember();
    log("nag update naman");
    update();
  }
}