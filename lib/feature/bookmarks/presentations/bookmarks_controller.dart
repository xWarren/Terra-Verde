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

    },
    cancelOnError: true,
    onError: (error) {
      log("bookmarkErr = $error");
      isLoading(false);
    });
  }

  
  @override
  void onClose() {
    _bookmarkSubs?.cancel();
    super.onClose();
  }
}