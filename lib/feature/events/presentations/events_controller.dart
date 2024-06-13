import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/domain/entities/add_bookmark_entity.dart';
import '../../../core/domain/entities/bookmark_data_entity.dart';
import '../../bookmarks/presentations/bookmarks_controller.dart';

class EventsController extends GetxController {

  EventsController({
    required this.bookmarkController,
  });

  final BookmarksController bookmarkController;

  RxBool isLoading = false.obs;
  

  RxInt id = 0.obs;
  RxString eventName = "".obs;
  RxString eventDate = "".obs;
  RxString eventDescription = "".obs;
  RxString eventLocation = "".obs;

  RxBool isBookmarked = false.obs;

  String formattedMonth = "";
  String formattedTime = "";

  late AddBookmarkEntity  addBookmarkEntity;

  RxList<BookmarkDataEntity> bookmarkData = <BookmarkDataEntity>[].obs;

  @override
  void onInit() {
   super.onInit();
    isLoading(true);
    id(Get.arguments["id"] ?? 0);
    eventName(Get.arguments["eventName"] ?? "");
    eventDate(Get.arguments["eventDate"] ?? "");
    eventDescription(Get.arguments["eventDescription"] ?? "");
    eventLocation(Get.arguments["eventLocation"] ?? "No set location");
    isLoading(Get.arguments["isLoading"] ?? false);

    String dateString = eventDate.value;
    DateTime parsedEventDate = DateTime.parse(dateString);

    DateFormat monthFormat = DateFormat('MMMM dd, yyyy');
    formattedMonth = monthFormat.format(parsedEventDate);

    DateFormat timeFormat = DateFormat('hh:mm a');
    formattedTime = timeFormat.format(parsedEventDate);
    checkIsBookmarked();
  }

   bool checkIsBookmarked() {
    return bookmarkController.bookmarkData.any((bookmark) => bookmark.eventId == id.value);
  }


  void bookmark() {
    isBookmarked.value = checkIsBookmarked();

    if (isBookmarked.value) {
      log("Event is already bookmarked");
      bookmarkController.deleteBookmark();
    } else {
      log("Event is not bookmarked. Adding bookmark...");
      bookmarkController.getBookmark(
        eventId: id.value,
        eventName: eventName.value,
        eventDescription: eventDescription.value,
        eventLocation: eventLocation.value,
      );
    }
  }  
}