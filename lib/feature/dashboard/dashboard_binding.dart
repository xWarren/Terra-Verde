import 'package:get/get.dart';

import '../../core/domain/usecases/announcement_usecase.dart';
import '../../core/domain/usecases/bookmark_usecase.dart';
import '../../core/domain/usecases/events_usecase.dart';
import '../../core/domain/usecases/officials_usecase.dart';
import '../bookmarks/domain/usecases/bookmark_usecase_impl.dart';
import '../bookmarks/presentations/bookmarks_controller.dart';
import '../events/presentations/events_controller.dart';
import '../home/domain/usecases/announcement_usecase_impl.dart';
import '../home/domain/usecases/events_usecase_impl.dart';
import '../home/presentations/home_controller.dart';
import '../home/domain/usecases/officials_usecase_impl.dart';
import '../settings/presentations/settings_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<BookmarkUseCase>(
      () => BookmarkUseCaseImpl(
        bookmarkRepository: Get.find()
      ),
      fenix: true
    );

    Get.lazyPut<BookmarksController>(
      () =>  BookmarksController(
        bookmarkUseCase: Get.find()
      ),
      fenix: true
    );

    Get.lazyPut<EventsController>(
      () =>  EventsController(
        bookmarkController: Get.find(),
        eventsUseCase: Get.find()
      ),
      fenix: true
    );

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
      () => SettingsController(
        storageService: Get.find(),
      ),
      fenix: true
    );

    Get.lazyPut<HomeController>(
      () => HomeController(
        storageService: Get.find(),
        dashboardDelegate: Get.find<DashboardController>(),
        eventsUseCase: Get.find(),
        announcementUseCase: Get.find(),
        officialsUseCase: Get.find(),
        eventDelegate: Get.find<EventsController>()
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