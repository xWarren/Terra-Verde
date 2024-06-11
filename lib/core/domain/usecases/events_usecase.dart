import '../entities/events_data_entity.dart';

abstract class EventsUseCase {

  Future<List<EventsDataEntity>> getEvents();
  Future<EventsDataEntity> getIdFromEvent({required int id});
}