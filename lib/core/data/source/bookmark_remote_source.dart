import '../model/get_bookmark_data_model.dart';
import '../model/get_bookmark_response_model.dart';

abstract class BookmarkRemoteSource {

  Future<GetBookmarkResponseModel> bookmark();
  Future<GetBookmarkDataModel> getIdFromBookmark({required int id});
}