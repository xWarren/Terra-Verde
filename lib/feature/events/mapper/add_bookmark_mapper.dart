import '../../../core/data/model/add_bookmark_response_model.dart';
import '../../../core/domain/entities/add_bookmark_entity.dart';
import '../data/model/feature_add_bookmark_response_model.dart';
import '../domain/entities/feature_add_bookmark_entity.dart';

class AddBookmarkMapper {

  static AddBookmarkResponseModel fromFeatureAddBookmarkResponseModel(FeatureAddBookmarkResponseModel model) {
    
    return AddBookmarkResponseModel(
      message: model.message
    );
  }

  static FeatureAddBookmarkEntity fromAddBookmarkResponseModel(AddBookmarkResponseModel model) {
    
    return FeatureAddBookmarkEntity(
      message: model.message
    );
  }

    static AddBookmarkEntity fromFeatureAddBookmarkEntity(FeatureAddBookmarkEntity entity) {
    
    return AddBookmarkEntity(
      message: entity.message
    );
  }
}