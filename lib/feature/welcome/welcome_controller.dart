import 'package:get/get.dart';

import '../../core/routes/routes.dart';

class WelcomeController extends GetxController {

  void goToRegister() {
    Get.toNamed(Routes.registerRoute);
  }

  void goToLogin() {
    Get.toNamed(Routes.loginRoute);
  }
}