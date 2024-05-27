import '../../../../core/data/model/events_response_model.dart';
import '../../../../core/data/source/events_remote_source.dart';
import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/resources/api_endpoint.dart';
import '../../../../core/utils/base_get_connect.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../mapper/events_mapper.dart';
import '../model/feature_events_response_model.dart';

class EventsRemoteSourceImpl extends BaseGetConnect implements EventsRemoteSource {

  EventsRemoteSourceImpl({
    required this.storageService
  });

  final StorageService storageService;

  @override
  Future<EventsResponseModel> events() async {
    var response = await methodRequest(
      APIEndpoint.events,
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureEventsResponseModel.fromJson(response.body);
    return EventsMapper.fromFeatureEventsResponseModel(featureResponseModel);
  }
}