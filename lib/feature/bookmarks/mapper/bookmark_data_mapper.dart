import '../../../core/data/model/get_bookmark_data_model.dart';
import '../../../core/domain/entities/bookmark_data_entity.dart';
import '../data/model/feature_bookmark_response_data_model.dart';
import '../domain/entities/feature_bookmark_data_entity.dart';

class BookmarkDataMapper {

  static GetBookmarkDataModel fromFeatureBookmarkResponseDataModel(FeatureBookmarkResponseDataModel model) {
    
    return GetBookmarkDataModel(
      id: model.id,
      eventId: model.eventId,
      eventName: model.eventName,
      eventDate: model.eventDate,
      eventImage: model.eventImage,
      eventDescription: model.eventDescription,
      eventLocation: model.eventLocation
    );
  }

  static FeatureBookmarkDataEntity fromGetBookmarkDataModel(GetBookmarkDataModel model) {
    
    return FeatureBookmarkDataEntity(
      id: model.id,
      eventId: model.eventId,
      eventName: model.eventName,
      eventDate: model.eventDate,
      eventImage: model.eventImage,
      eventDescription: model.eventDescription,
      eventLocation: model.eventLocation
    );
  }

    static BookmarkDataEntity fromFeatureBookmarkDataEntity(FeatureBookmarkDataEntity entity) {
    
    return BookmarkDataEntity(
      id: entity.id,
      eventId: entity.eventId,
      eventName: entity.eventName,
      eventDate: entity.eventDate,
      eventImage: entity.eventImage,
      eventDescription: entity.eventDescription,
      eventLocation: entity.eventLocation
    );
  }
}