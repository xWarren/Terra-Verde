import 'package:get/get.dart';

import '../../core/domain/services/storage_service.dart';
import '../../core/routes/routes.dart';

class SplashController extends GetxController {

  SplashController({
    required this.storageService
  });

  final StorageService storageService;

  @override
  void onInit() {
    nextPage();
    super.onInit();
  }

  void nextPage() {
    if(storageService.isLoggedIn() == true) {
      Future.delayed(
        3.seconds, 
        () => Get.offAndToNamed(Routes.dashboardRoute)
      );
    } else {
      Future.delayed(
        3.seconds, 
        () => Get.offAndToNamed(Routes.welcomeRoute)
      );
    }
  }
}