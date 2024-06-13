import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/domain/entities/bookmark_data_entity.dart';
import '../../../core/domain/usecases/bookmark_usecase.dart';

class BookmarksController extends GetxController {

  BookmarksController({
    required this.bookmarkUseCase
  });

  final BookmarkUseCase bookmarkUseCase;

  StreamSubscription? _bookmarkSubs;
  StreamSubscription? _bookmarkIdSubs;

  RxBool isLoading = false.obs;

  RxList<BookmarkDataEntity> bookmarkData = <BookmarkDataEntity>[].obs;

  RxInt id = 0.obs;
  RxString eventName = "".obs;
  RxString eventDate = "".obs;
  RxString eventDescription = "".obs;
  RxString eventLocation = "".obs;


  @override
  void onInit() {
    super.onInit();
    bookmark();
  }


  void bookmark() {
    isLoading(true);
    _bookmarkSubs?.cancel();

    _bookmarkSubs = bookmarkUseCase.bookmark().asStream().listen((response) {
      bookmarkData.assignAll(response);
    log("asdasdas");
      for (var bookmark in response ) {
        id.value =  bookmark.id;
      }
      
      isLoading(false); 
      update();

    },
    cancelOnError: true,
    onError: (error) {
      log("bookmarkErr = $error");
      isLoading(false);
    });
  }

  void getBookmark({
    required int eventId,
    required String eventName,
    required String eventDescription,
    required String eventLocation,
  }) {

    _bookmarkSubs?.cancel();

    _bookmarkSubs = bookmarkUseCase.addBookmark(
      eventId: eventId,
      eventName: eventName,
      eventDescription: eventDescription,
      eventLocation: eventLocation,
    ).asStream().listen((value) {
      bookmark();
    },
    cancelOnError: true,
    onError: (error) {
      log("getBookmarkErr = $error");
    });
  }

  void deleteBookmark() {
    _bookmarkSubs?.cancel();

    _bookmarkSubs = bookmarkUseCase.deleteBookmark(
      id: id.value
    ).asStream().listen((value) {
      bookmark();
    },
    cancelOnError: true,
    onError: (error) {
      log("deleteBookmarkErr = $error");
    });
  }

  void getIdFromBookmark({required int id}) {
    
    _bookmarkIdSubs?.cancel();
    _bookmarkIdSubs = bookmarkUseCase.getIdFromBookmark(id: id).asStream().listen((response){
    log("asdasdas");
        // Get.toNamed(
        //   Routes.eventRoute,
        //   arguments: {
        //     "id": id;
        //   }
        // )

    });
    

  }
  

  
  @override
  void onClose() {
    _bookmarkSubs?.cancel();
    _bookmarkIdSubs?.cancel();
    super.onClose();
  }
}