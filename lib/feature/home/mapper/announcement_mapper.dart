import '../../../core/data/model/get_announcement_response_data_model.dart';
import '../../../core/data/model/get_announcement_response_model.dart';
import '../data/model/feature_announcement_response_model.dart';
import 'announcement_data_mapper.dart';

class AnnouncementMapper {

  static GetAnnouncementResponseModel fromFeatureAnnouncementResponseModel(FeatureAnnouncementResponseModel model) {
    
    return GetAnnouncementResponseModel(
      data: model.data.map<GetAnnouncementResponseDataModel>((e) => AnnouncementDataMapper.fromFeatureAnnouncementResponseDataModel(e)).toList()
    );
  }
}