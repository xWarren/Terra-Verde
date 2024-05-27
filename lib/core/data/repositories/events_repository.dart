import '../../domain/entities/events_data_entity.dart';

abstract class EventsRepository {

  Future<List<EventsDataEntity>> events(); 
}