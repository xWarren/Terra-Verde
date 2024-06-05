import 'package:get/get.dart';

import '../../../core/domain/services/storage_service.dart';
import '../../../core/routes/routes.dart';

class SettingsController extends GetxController {
  
  SettingsController({
    required this.storageService
  });

  final StorageService storageService;

  void logout() {
    storageService.clearAll();
    Get.offAndToNamed(Routes.loginRoute);
  }
}