import 'package:get/get.dart';

import 'bookmarks_controller.dart';

class BookmarksBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookmarksController());
  }
}