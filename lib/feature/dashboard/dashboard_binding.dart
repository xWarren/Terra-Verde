import 'package:get/get.dart';

import '../events/events_controller.dart';
import '../home/home_controller.dart';
import '../officials/officials_controller.dart';
import '../profile/profile_controller.dart';
import 'dashboard_controller.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ProfileController>(
      () => ProfileController(),
      fenix: true
    );

    Get.lazyPut<OfficialsController>(
      () => OfficialsController(),
      fenix: true
    );

    Get.lazyPut<EventsController>(
      () => EventsController(),
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