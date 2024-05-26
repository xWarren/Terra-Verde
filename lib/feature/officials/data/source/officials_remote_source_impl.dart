import '../../../../core/data/model/officials_response_model.dart';
import '../../../../core/data/source/officials_remote_source.dart';
import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/resources/api_endpoint.dart';
import '../../../../core/utils/base_get_connect.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../mapper/officials_mapper.dart';
import '../model/feature_officials_response_model.dart';

class OfficialsRemoteSourceImpl extends BaseGetConnect implements OfficialsRemoteSource {

  OfficialsRemoteSourceImpl({
    required this.storageService
  });

  final StorageService storageService;

  @override
  Future<OfficialsResponseModel> officials() async {
    var response = await methodRequest(
      APIEndpoint.officials,
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureOfficialsResponseModel.fromJson(response.body);
    return OfficialsMapper.fromFeatureOfficialsResponseModel(featureResponseModel);
  }
}