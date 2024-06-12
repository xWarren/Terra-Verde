import '../../../core/data/model/get_bookmark_data_model.dart';
import '../../../core/data/model/get_bookmark_response_model.dart';
import '../data/model/feature_bookmark_response_model.dart';
import 'bookmark_data_mapper.dart';

class BookmarkMapper {

  static GetBookmarkResponseModel fromFeatureBookmarkResponseModel(FeatureBookmarkResponseModel model) {
    
    return GetBookmarkResponseModel(
      data: model.data.map<GetBookmarkDataModel>((e) => BookmarkDataMapper.fromFeatureBookmarkResponseDataModel(e)).toList()
    );
  }
}