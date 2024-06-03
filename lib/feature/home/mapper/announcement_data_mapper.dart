import '../../../core/data/model/get_announcement_response_data_model.dart';
import '../../../core/domain/entities/announcement_data_entity.dart';
import '../data/model/feature_announcement_response_data_model.dart';
import '../domain/entities/feature_announcement_data_entity.dart';

class AnnouncementDataMapper {

  static GetAnnouncementResponseDataModel fromFeatureAnnouncementResponseDataModel(FeatureAnnouncementResponseDataModel model) {
    
    return GetAnnouncementResponseDataModel(
      id: model.id,
      announcementName: model.announcementName,
      announcementDate: model.announcementDate,
      announcementDescription: model.announcementDescription
    );
  }

  static FeatureAnnouncementDataEntity fromGetAnnouncementResponseDataModel(GetAnnouncementResponseDataModel model) {
    
    return FeatureAnnouncementDataEntity(
      id: model.id,
      announcementName: model.announcementName,
      announcementDate: model.announcementDate,
      announcementDescription: model.announcementDescription
    );
  }

    static AnnouncementDataEntity fromFeatureAnnouncementDataEntity(FeatureAnnouncementDataEntity entity) {
    
    return AnnouncementDataEntity(
      id: entity.id,
      announcementName: entity.announcementName,
      announcementDate: entity.announcementDate,
      announcementDescription: entity.announcementDescription
    );
  }
}