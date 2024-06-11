import '../../../../core/data/model/get_resident_response_model.dart';
import '../../../../core/data/source/resident_remote_source.dart';
import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/resources/api_endpoint.dart';
import '../../../../core/utils/base_get_connect.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../mapper/get_resident_mapper.dart';
import '../model/feature_resident_response_model.dart';

class ResidentRemoteSourceImpl extends BaseGetConnect implements ResidentRemoteSource {

  ResidentRemoteSourceImpl({
    required this.storageService
  });

  final StorageService storageService;

@override
  Future<GetResidentResponseModel> getResident({required int id}) async {
    var response = await methodRequest(
      "${APIEndpoint.resident}/$id",
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureResidentResponseModel.fromJson(response.body);
    return GetResidentMapper.fromFeatureResidentResponseModel(featureResponseModel);
  }
}