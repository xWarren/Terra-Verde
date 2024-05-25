import 'package:get/get.dart';

import '../home/home_controller.dart';
import '../officials/officials_controller.dart';
import '../settings/presentations/settings_controller.dart';
import 'dashboard_controller.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<SettingsController>(
      () => SettingsController(),
      fenix: true
    );

    Get.lazyPut<OfficialsController>(
      () => OfficialsController(),
      fenix: true
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true
    );

    Get.put<DashboardController>(
      DashboardController(
        storageService: Get.find()
      ),
    );
  }
}