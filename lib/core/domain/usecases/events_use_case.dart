import '../entities/events_data_entity.dart';

abstract class EventsUseCase {

  Future<List<EventsDataEntity>> execute();
  Future<List<EventsDataEntity>> getIdFromEvent({required int id});
}