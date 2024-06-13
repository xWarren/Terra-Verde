import '../model/add_bookmark_response_model.dart';
import '../model/get_bookmark_data_model.dart';
import '../model/get_bookmark_response_model.dart';

abstract class BookmarkRemoteSource {

  Future<GetBookmarkResponseModel> bookmark();
  Future<GetBookmarkDataModel> getIdFromBookmark({required int id});
  Future<AddBookmarkResponseModel> addBookmark(body);
  Future<AddBookmarkResponseModel> deleteBookmark({required int id});
}