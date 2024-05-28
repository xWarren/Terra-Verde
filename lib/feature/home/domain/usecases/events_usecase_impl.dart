import '../../../../core/data/repositories/events_repository.dart';
import '../../../../core/domain/entities/events_data_entity.dart';
import '../../../../core/domain/usecases/events_use_case.dart';
import '../payload/events_param.dart';

class EventsUseCaseImpl implements EventsUseCase {

  EventsUseCaseImpl({
    required this.eventsRepository
  });

  final EventsRepository eventsRepository;

  @override
  Future<List<EventsDataEntity>> execute() {

    return eventsRepository.events();
  }
  
  @override
  Future<EventsDataEntity> getIdFromEvent({required int id}) {

    var param = EventsParam(
      id: id
    );

    return eventsRepository.getIdFromEvent(param);
  }
}