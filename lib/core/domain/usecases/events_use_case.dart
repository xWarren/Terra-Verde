import '../entities/events_data_entity.dart';

abstract class EventsUseCase {

  Future<List<EventsDataEntity>> execute();
  Future<EventsDataEntity> getIdFromEvent({required int id});
}