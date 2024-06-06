import 'package:get/get.dart';

import '../../core/routes/routes.dart';

class WelcomeController extends GetxController {

  RxBool isHeadOfTheFamily = false.obs;

  void headFamilyLogin() {
    isHeadOfTheFamily.value = true;
    Get.toNamed(
      Routes.loginRoute,
      arguments: {
        "isHeadOfTheFamily": isHeadOfTheFamily.value
      }
    );
  }

  void familyMemberLogin() {
    isHeadOfTheFamily.value = false;
    Get.toNamed(
      Routes.loginRoute,
      arguments: {
        "isHeadOfTheFamily": isHeadOfTheFamily.value
      }
    );
  }
  
}