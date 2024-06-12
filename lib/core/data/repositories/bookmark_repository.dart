import '../../../feature/bookmarks/domain/payload/bookmark_param.dart';
import '../../domain/entities/bookmark_data_entity.dart';

abstract class BookmarkRepository {

  Future<List<BookmarkDataEntity>> bookmark(); 
  Future<BookmarkDataEntity> getIdFromBookmark(BookmarkParam param);
}