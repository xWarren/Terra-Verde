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

  RxBool isLoading = false.obs;

  RxList<BookmarkDataEntity> bookmarkData = <BookmarkDataEntity>[].obs;

  RxInt id = 0.obs;


  @override
  void onInit() {
    bookmark();
    super.onInit();
  }


  void bookmark() {
    isLoading(true);
    _bookmarkSubs?.cancel();

    _bookmarkSubs = bookmarkUseCase.bookmark().asStream().listen((response) {

       bookmarkData.assignAll(response);
       isLoading(false); 

       for (var bookmark in response ) {
         id.value =  bookmark.id;
       }

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
  

  
  @override
  void onClose() {
    _bookmarkSubs?.cancel();
    super.onClose();
  }
}