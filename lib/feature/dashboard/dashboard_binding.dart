import 'package:get/get.dart';

import '../../core/domain/usecases/events_use_case.dart';
import '../../core/domain/usecases/officials_usecase.dart';
import '../home/domain/usecases/events_usecase_impl.dart';
import '../home/presentations/home_controller.dart';
import '../officials/domain/usecases/officials_usecase_impl.dart';
import '../officials/presentations/officials_controller.dart';
import '../settings/presentations/settings_controller.dart';
import 'dashboard_controller.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<EventsUseCase>(
      () => EventsUseCaseImpl(
        eventsRepository: Get.find()
      ),
      fenix: true
    );

      Get.lazyPut<OfficialsUseCase>(
      () => OfficialsUseCaseImpl(
        officialsRepository: Get.find()
      ),
      fenix: true
    );

    Get.lazyPut<SettingsController>(
      () => SettingsController(),
      fenix: true
    );

    Get.lazyPut<OfficialsController>(
      () => OfficialsController(
        officialsUseCase: Get.find()
      ),
      fenix: true
    );

    Get.lazyPut<HomeController>(
      () => HomeController(
        storageService: Get.find(),
        eventsUseCase: Get.find()
      ),
      fenix: true
    );

    Get.put<DashboardController>(
      DashboardController(
        storageService: Get.find()
      ),
    );
  }
}