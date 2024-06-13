import '../../../feature/bookmarks/domain/payload/bookmark_param.dart';
import '../../../feature/events/domain/payload/add_bookmark_param.dart';
import '../../../feature/events/domain/payload/delete_bookmark_param.dart';
import '../../domain/entities/add_bookmark_entity.dart';
import '../../domain/entities/bookmark_data_entity.dart';

abstract class BookmarkRepository {

  Future<List<BookmarkDataEntity>> bookmark(); 
  Future<BookmarkDataEntity> getIdFromBookmark(BookmarkParam param);
  Future<AddBookmarkEntity> addBookmark(AddBookmarkParam param);
  Future<AddBookmarkEntity> deleteBookmark(DeleteBookmarkParam param);
}