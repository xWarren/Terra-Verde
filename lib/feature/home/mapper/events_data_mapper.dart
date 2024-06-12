import '../../../core/data/model/events_response_data_model.dart';
import '../../../core/domain/entities/events_data_entity.dart';
import '../data/model/feature_events_response_data_model.dart';
import '../domain/entities/feature_events_data_entity.dart';

class EventsDataMapper {

  static EventsResponseDataModel fromFeatureEventsResponseDataModel(FeatureEventsResponseDataModel model) {
    
    return EventsResponseDataModel(
      id: model.id,
      eventName: model.eventName,
      eventDate: model.eventDate,
      eventImage: model.eventImage,
      eventDescription: model.eventDescription,
      eventLocation: model.eventLocation
    );
  }

  static FeatureEventsDataEntity fromEventsResponseDataModel(EventsResponseDataModel model) {
    
    return FeatureEventsDataEntity(
      id: model.id,
      eventName: model.eventName,
      eventDate: model.eventDate,
      eventImage: model.eventImage,
      eventDescription: model.eventDescription,
      eventLocation: model.eventLocation
    );
  }

    static EventsDataEntity fromFeatureEventsDataEntity(FeatureEventsDataEntity entity) {
    
    return EventsDataEntity(
      id: entity.id,
      eventName: entity.eventName,
      eventDate: entity.eventDate,
      eventImage: entity.eventImage,
      eventDescription: entity.eventDescription,
      eventLocation: entity.eventLocation
    );
  }
}