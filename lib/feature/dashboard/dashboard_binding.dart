import 'package:get/get.dart';

import '../../core/domain/usecases/announcement_use_case.dart';
import '../../core/domain/usecases/events_use_case.dart';
import '../../core/domain/usecases/officials_usecase.dart';
import '../home/domain/usecases/announcement_usecase_impl.dart';
import '../home/domain/usecases/events_usecase_impl.dart';
import '../home/presentations/home_controller.dart';
import '../officials/domain/usecases/officials_usecase_impl.dart';
import '../officials/presentations/officials_controller.dart';
import '../settings/presentations/settings_controller.dart';
import 'dashboard_controller.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut<AnnouncementUseCase>(
      () => AnnouncementUseCaseImpl(
        announcementRepository: Get.find()
      ),
      fenix: true
    );

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
        dashboardDelegate: Get.find<DashboardController>(),
        officialsUseCase: Get.find()
      ),
      fenix: true
    );

    Get.lazyPut<HomeController>(
      () => HomeController(
        storageService: Get.find(),
        dashboardDelegate: Get.find<DashboardController>(),
        eventsUseCase: Get.find(),
        announcementUseCase: Get.find()
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