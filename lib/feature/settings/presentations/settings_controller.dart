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

  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString email = "".obs;
  RxString address = "".obs;
  RxString profileImage = "".obs;


  @override
  void onInit() {
    residentId(storageService.getResidentId());
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
      firstName(response.firstName);
      lastName(response.lastName);
      address(response.address);
      email(response.email);
      id(response.id);
      update();
    });

  }


  void goToProfile() {
    Get.toNamed(
      Routes.profileRoute,
      arguments: {
        "residentId": id.value,
        "firstName": firstName.value,
        "lastName": lastName.value,
        "address": address.value,
        "email": email.value,
      }
    );
  }

  @override
  void onClose() {
    _residentSubs?.cancel();
    super.onClose();
  }
}