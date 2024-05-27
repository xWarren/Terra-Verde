import '../../../core/data/model/events_response_data_model.dart';
import '../../../core/data/model/events_response_model.dart';
import '../data/model/feature_events_response_model.dart';
import 'events_data_mapper.dart';

class EventsMapper {

  static EventsResponseModel fromFeatureEventsResponseModel(FeatureEventsResponseModel model) {
    
    return EventsResponseModel(
      data: model.data.map<EventsResponseDataModel>((e) => EventsDataMapper.fromFeatureEventsResponseDataModel(e)).toList()
    );
  }
}