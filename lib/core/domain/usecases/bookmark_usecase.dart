import '../entities/add_bookmark_entity.dart';
import '../entities/bookmark_data_entity.dart';

abstract class BookmarkUseCase {

  Future<List<BookmarkDataEntity>> bookmark();
  Future<BookmarkDataEntity> getIdFromBookmark({required int id});
  Future<AddBookmarkEntity> addBookmark({
    required int eventId,
    required String eventName,
    required String eventDescription,
    required String eventLocation
  });
}