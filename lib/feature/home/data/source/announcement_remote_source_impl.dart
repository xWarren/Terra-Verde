import '../../../../core/data/model/get_announcement_response_data_model.dart';
import '../../../../core/data/model/get_announcement_response_model.dart';
import '../../../../core/data/source/announcement_remote_source.dart';
import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/resources/api_endpoint.dart';
import '../../../../core/utils/base_get_connect.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../mapper/announcement_data_mapper.dart';
import '../../mapper/announcement_mapper.dart';
import '../model/feature_announcement_response_data_model.dart';
import '../model/feature_announcement_response_model.dart';

class AnnouncementRemoteSourceImpl extends BaseGetConnect implements AnnouncementRemoteSource {

  AnnouncementRemoteSourceImpl({
    required this.storageService
  });

  final StorageService storageService;

  @override
  Future<GetAnnouncementResponseModel> getAnnouncement() async {
    var response = await methodRequest(
      APIEndpoint.announcement,
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureAnnouncementResponseModel.fromJson(response.body);
    return AnnouncementMapper.fromFeatureAnnouncementResponseModel(featureResponseModel);
  }
  
  @override
  Future<GetAnnouncementResponseDataModel> getIdFromAnnouncement({required int id}) async {
    var response = await methodRequest(
      "${APIEndpoint.announcement}/$id",
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureAnnouncementResponseDataModel.fromJson(response.body);
    return AnnouncementDataMapper.fromFeatureAnnouncementResponseDataModel(featureResponseModel);
  }
}