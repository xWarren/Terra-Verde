import '../../../../core/data/repositories/events_repository.dart';
import '../../../../core/data/source/events_remote_source.dart';
import '../../../../core/domain/entities/events_data_entity.dart';
import '../../domain/entities/feature_events_data_entity.dart';
import '../../domain/payload/events_param.dart';
import '../../mapper/events_data_mapper.dart';


class EventsRepositoryImpl implements EventsRepository {

  EventsRepositoryImpl({
    required this.remoteSource
  });

  final EventsRemoteSource remoteSource;

  @override
  Future<List<EventsDataEntity>> events() async {
    var response = await remoteSource.events();
    var featureEntity = response.data.map<FeatureEventsDataEntity>((e) => EventsDataMapper.fromEventsResponseDataModel(e)).toList();
    var entity = featureEntity.map<EventsDataEntity>((e) => EventsDataMapper.fromFeatureEventsDataEntity(e)).toList();
    return entity;
  }

  @override
  Future<EventsDataEntity> getIdFromEvent(EventsParam param) async {
    var response = await remoteSource.getIdFromEvent(id: param.id);
    var featureEntity = EventsDataMapper.fromEventsResponseDataModel(response);
    var entity = EventsDataMapper.fromFeatureEventsDataEntity(featureEntity);
    return entity;
  }
}