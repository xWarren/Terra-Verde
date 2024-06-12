import 'package:get/get.dart';

import '../../../core/domain/usecases/bookmark_usecase.dart';
import '../domain/usecases/bookmark_usecase_impl.dart';
import 'bookmarks_controller.dart';

class BookmarksBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<BookmarkUseCase>(
      () => BookmarkUseCaseImpl(
        bookmarkRepository: Get.find()
      ),
      fenix: true
    );

    Get.put(
      BookmarksController(
        bookmarkUseCase: Get.find()
      )
    );
  }
}