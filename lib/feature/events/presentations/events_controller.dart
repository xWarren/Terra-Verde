import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/domain/entities/add_bookmark_entity.dart';
import '../../../core/domain/entities/bookmark_data_entity.dart';
import '../../../core/domain/usecases/events_usecase.dart';
import '../../../core/utils/print_utils.dart';
import '../../bookmarks/presentations/bookmarks_controller.dart';

abstract class EventDelegate {

  void getEvent({required int id});
}

class EventsController extends GetxController implements EventDelegate {

  EventsController({
    required this.bookmarkController,
    required this.eventsUseCase
  });

  final BookmarksController bookmarkController;

  final EventsUseCase eventsUseCase;
  StreamSubscription? eventsSubs;

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
    // id(Get.arguments["id"] ?? 0);
    // eventName(Get.arguments["eventName"] ?? "");
    // eventDate(Get.arguments["eventDate"] ?? "");
    // eventDescription(Get.arguments["eventDescription"] ?? "");
    // eventLocation(Get.arguments["eventLocation"] ?? "No set location");
    // // isLoading(Get.arguments["isLoading"] ?? false);
    checkIsBookmarked();
  }


  void getIdFromEvents({required int id}) {
    isLoading(true);

    eventsSubs?.cancel();
    eventsSubs = eventsUseCase.getIdFromEvent(id: id).asStream().listen((response) {
      
      this.id(response.id);
      eventName(response.eventName);
      eventDate(response.eventDate);
      eventDescription(response.eventDescription);
      eventLocation(response.eventLocation);

      
      String dateString = eventDate.value;
      DateTime parsedEventDate = DateTime.parse(dateString);

      DateFormat monthFormat = DateFormat('MMMM dd, yyyy');
      formattedMonth = monthFormat.format(parsedEventDate);

      DateFormat timeFormat = DateFormat('hh:mm a');
      formattedTime = timeFormat.format(parsedEventDate);

      isLoading(false);

      update();
    },
    onError: (error) {
      printUtil("getEventsErr: $error");
    });
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

  @override
  void onClose() {
    eventsSubs?.cancel();
    super.onClose();
  }
  
  @override
  void getEvent({required int id}) {
   getIdFromEvents(id: id);
  }
}