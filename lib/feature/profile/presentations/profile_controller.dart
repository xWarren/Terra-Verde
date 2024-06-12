import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';

import '../../../core/domain/entities/resident_house_member_data_entity.dart';
import '../../../core/domain/services/storage_service.dart';
import '../../../core/domain/usecases/resident_house_member_usecase.dart';
import '../../../core/routes/routes.dart';
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
  StreamSubscription? deleteResidentSubs;
  
  RxList<ResidentHouseMemberDataEntity> residentsData = <ResidentHouseMemberDataEntity>[].obs;

  RxInt residentId = 0.obs;

  RxBool isLoading = false.obs;

  RxString firstName = "".obs;
  RxString middleName = "".obs;
  RxString lastName = "".obs;
  RxString familyRelationship = "".obs;

  RxString residentFirstName = "".obs;
  RxString residentLastName = "".obs;
  RxString residentAddress = "".obs;
  RxString residentEmail = "".obs;

  RxInt id = 0.obs;

  RxBool isHeadFamily = false.obs;

  @override
  void onInit() {
    getResidentsMember();
    isHeadFamily.value = storageService.isHeadFamily();
    printUtil("hello");
    id(Get.arguments["residentId"]);
    residentFirstName(Get.arguments["firstName"]);
    residentLastName(Get.arguments["lastName"]);
    residentAddress(Get.arguments["address"]);
    residentEmail(Get.arguments["email"]);
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
    cancelOnError: true,
    onError: (error) {
      printUtil("getResidentsMemberErr: $error");
      isLoading(false);
      update();
    });
  }

  void deleteResidentHouseMember(int id) {
    isLoading(true);

    deleteResidentSubs?.cancel();

    deleteResidentSubs = residentHouseMemberUseCase.deleteIdFromResidentHouseMember(id: id).asStream().listen((response){
      getResidentsMember();
      log("Deleted na");
      isLoading(false);
    },
    cancelOnError: true,
    onError: (error) {
      printUtil("deleteResidentHouseMemberErr: $error");
      isLoading(false);
      update();
    });
  }

  void onTap() {
    Get.toNamed(
      Routes.profileInformationRoute,
      arguments: {
        "id": id.value
      }
    );
  }
  
  @override
  void onClose() {
    residentsSubs?.cancel();
    deleteResidentSubs?.cancel();
    super.onClose();
  }
  
  @override
  void getResident() {
    getResidentsMember();
    log("nag update naman");
    update();
  }
}