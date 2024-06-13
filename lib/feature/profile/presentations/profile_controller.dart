import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:terra_verde/core/utils/extensions/getx_extension.dart';

import '../../../core/domain/entities/resident_house_member_data_entity.dart';
import '../../../core/domain/services/storage_service.dart';
import '../../../core/domain/usecases/resident_house_member_usecase.dart';
import '../../../core/domain/usecases/resident_usecase.dart';
import '../../../core/routes/routes.dart';
import '../../../core/utils/print_utils.dart';

abstract class ProfileDelegate {
  void getResident();
}

class ProfileController extends GetxController implements ProfileDelegate {

  ProfileController({
    required this.storageService,
    required this.residentHouseMemberUseCase,
    required this.residentUseCase
  });

  final StorageService storageService;

  final ResidentHouseMemberUseCase residentHouseMemberUseCase;

  StreamSubscription? residentsSubs;
  StreamSubscription? deleteResidentSubs;

  final ResidentUseCase residentUseCase;
  StreamSubscription? _residentSubs;
  
  RxList<ResidentHouseMemberDataEntity> residentsData = <ResidentHouseMemberDataEntity>[].obs;

  RxInt residentId = 0.obs;

  RxBool isLoading = false.obs;

  String profileImage = "";
  RxString firstName = "".obs;
  RxString middleName = "".obs;
  RxString lastName = "".obs;
  RxString familyRelationship = "".obs;

  RxString residentFirstName = "".obs;
  RxString residentLastName = "".obs;
  RxString residentAddress = "".obs;
  RxString residentEmail = "".obs;

  RxString getId = "".obs;

  RxInt id = 0.obs;

  RxBool isHeadFamily = false.obs;

  String get getResidentId => storageService.getResidentId();

  @override
  void onInit() {
    headFamily();
    getResidentsMember();
    isHeadFamily.value = storageService.isHeadFamily();
    getId(storageService.getId());
    log("DITO $isHeadFamily");
    printUtil("hello");
    super.onInit();
  }


  void headFamily() {
    isLoading(true);

    _residentSubs?.cancel();

    _residentSubs = residentUseCase.getResident(id: int.parse(getResidentId)).asStream().listen((response) {
      residentFirstName(response.firstName);
      profileImage = response.profileImage;
      residentLastName(response.lastName);
      residentAddress(response.address);
      residentEmail(response.email);
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

  void showModal({required int id}) {
    showCustomDialog(
      "Delete Family Member(1)",
      "Are you sure you want to delete?",
      onPressedDelete: () {
        deleteResidentHouseMember(id: id);
      }
    );
  }


  void deleteResidentHouseMember({required int id}) {
    isLoading(true);

    deleteResidentSubs?.cancel();

    deleteResidentSubs = residentHouseMemberUseCase.deleteIdFromResidentHouseMember(id: id).asStream().listen((response){
      Get.back();
      getResidentsMember();
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
      Routes.headFamilyRoute,
      arguments: {
        "id": id.value
      }
    );
  }
  
  @override
  void onClose() {
    residentsSubs?.cancel();
    _residentSubs?.cancel();
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