import 'package:get/get.dart';

import '../../../core/domain/services/storage_service.dart';
import '../../../core/routes/routes.dart';

class SettingsController extends GetxController {
  
  SettingsController({
    required this.storageService
  });

  final StorageService storageService;

  RxString residentId = "".obs;


  @override
  void onInit() {
    residentId(storageService.getResidentId());
    super.onInit();
  }

  void logout() {
    storageService.clearAll();
    Get.offAndToNamed(Routes.welcomeRoute);
  }


  void getResident() {

  }
}