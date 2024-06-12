import '../entities/bookmark_data_entity.dart';

abstract class BookmarkUseCase {

  Future<List<BookmarkDataEntity>> bookmark();
  Future<BookmarkDataEntity> getIdFromBookmark({required int id});
}