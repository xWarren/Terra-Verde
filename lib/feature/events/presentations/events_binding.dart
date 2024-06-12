import 'package:get/get.dart';

import '../../../core/domain/usecases/bookmark_usecase.dart';
import '../../bookmarks/domain/usecases/bookmark_usecase_impl.dart';
import '../../bookmarks/presentations/bookmarks_controller.dart';
import 'events_controller.dart';

class EventsBinding extends Bindings {
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

    Get.put(
      EventsController(
        bookmarkController: Get.find(),
      )
    );
  }
}