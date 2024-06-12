import 'dart:async';

import 'package:get/get.dart';

import '../../../core/domain/services/storage_service.dart';
import '../../../core/domain/usecases/resident_usecase.dart';
import '../../../core/routes/routes.dart';

class SettingsController extends GetxController {
  
  SettingsController({
    required this.storageService,
    required this.residentUseCase
  });

  final StorageService storageService;

  final ResidentUseCase residentUseCase;
  StreamSubscription? _residentSubs;

  RxString residentId = "".obs;

  RxInt id = 0.obs;

  RxString headFirstName = "".obs;
  RxString headLastName = "".obs;
  RxString headEmail = "".obs;
  RxString headAddress = "".obs;
  RxString headProfileImage = "".obs;

  RxString firstName = "".obs;
  RxString lastName = "".obs;


  @override
  void onInit() {
    residentId(storageService.getResidentId());
    firstName(storageService.getFirstName());
    lastName(storageService.getLastName());
    getResident();
    super.onInit();
  }

  void logout() {
    storageService.clearAll();
    Get.offAndToNamed(Routes.welcomeRoute);
  }


  void getResident() {

    _residentSubs?.cancel();

    _residentSubs = residentUseCase.getResident(id: int.parse(residentId.value)).asStream().listen((response) {
      headFirstName(response.firstName);
      headLastName(response.lastName);
      headAddress(response.address);
      headEmail(response.email);
      id(response.id);
      update();
    });

  }


  void goToProfile() {
    Get.toNamed(
      Routes.profileRoute,
      arguments: {
        "residentId": id.value,
        "firstName": headFirstName.value,
        "lastName": headLastName.value,
        "address": headAddress.value,
        "email": headEmail.value,
      }
    );
  }

  @override
  void onClose() {
    _residentSubs?.cancel();
    super.onClose();
  }
}