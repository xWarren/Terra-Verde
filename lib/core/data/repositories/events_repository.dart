import '../../../feature/home/domain/payload/events_param.dart';
import '../../domain/entities/events_data_entity.dart';

abstract class EventsRepository {

  Future<List<EventsDataEntity>> events(); 
  Future<EventsDataEntity> getIdFromEvent(EventsParam param);
}