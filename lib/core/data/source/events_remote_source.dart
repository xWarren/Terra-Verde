import '../model/events_response_model.dart';

abstract class EventsRemoteSource {

  Future<EventsResponseModel> events();
}