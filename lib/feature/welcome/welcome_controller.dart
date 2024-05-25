import 'package:get/get.dart';

import '../../core/routes/routes.dart';

class WelcomeController extends GetxController {

  void goToRegister() {
    Get.offAndToNamed(Routes.registerRoute);
  }

  void goToLogin() {
    Get.offAndToNamed(Routes.loginRoute);
  }
}