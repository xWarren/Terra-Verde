import '../model/events_response_data_model.dart';
import '../model/events_response_model.dart';

abstract class EventsRemoteSource {

  Future<EventsResponseModel> events();
  Future<EventsResponseDataModel> getIdFromEvent({required int id});
}