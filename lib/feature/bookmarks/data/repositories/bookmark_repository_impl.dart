import '../../../../core/data/repositories/bookmark_repository.dart';
import '../../../../core/data/source/bookmark_remote_source.dart';
import '../../../../core/domain/entities/bookmark_data_entity.dart';
import '../../domain/entities/feature_bookmark_data_entity.dart';
import '../../domain/payload/bookmark_param.dart';
import '../../mapper/bookmark_data_mapper.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {

  BookmarkRepositoryImpl({
    required this.remoteSource
  });

  final BookmarkRemoteSource remoteSource;

  @override
  Future<List<BookmarkDataEntity>> bookmark() async {
    var response = await remoteSource.bookmark();
    var featureEntity = response.data.map<FeatureBookmarkDataEntity>((e) => BookmarkDataMapper.fromGetBookmarkDataModel(e)).toList();
    var entity = featureEntity.map<BookmarkDataEntity>((e) => BookmarkDataMapper.fromFeatureBookmarkDataEntity(e)).toList();
    return entity;
  }

  @override
  Future<BookmarkDataEntity> getIdFromBookmark(BookmarkParam param) async {
    var response = await remoteSource.getIdFromBookmark(id: param.id);
    var featureEntity = BookmarkDataMapper.fromGetBookmarkDataModel(response);
    var entity = BookmarkDataMapper.fromFeatureBookmarkDataEntity(featureEntity);
    return entity;
  }
}