import '../../../../core/data/model/get_residents_response_data_model.dart';
import '../../../../core/data/model/get_residents_response_model.dart';
import '../../../../core/data/source/residents_remote_source.dart';
import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/resources/api_endpoint.dart';
import '../../../../core/utils/base_get_connect.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../mapper/add_residents_data_mapper.dart';
import '../../mapper/add_residents_mapper.dart';
import '../model/feature_residents_response_data_model.dart';
import '../model/feature_residents_response_model.dart';

class ResidentsRemoteSourceImpl extends BaseGetConnect implements ResidentsRemoteSource {

  ResidentsRemoteSourceImpl({
    required this.storageService
  });

  final StorageService storageService;

  @override
  Future<GetResidentsResponseModel> getResidents() async {
    var response = await methodRequest(
      APIEndpoint.residentsHouseMembers,
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureResidentsResponseModel.fromJson(response.body);
    return AddResidentsMapper.fromFeatureResidentsResponseModel(featureResponseModel);
  }

  @override
  Future<GetResidentsResponseDataModel> getIdFromResidents({required int id}) async {
    var response = await methodRequest(
      "${APIEndpoint.residentsHouseMembers}/$id",
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureResidentsResponseDataModel.fromJson(response.body);
    return AddResidentsDataMapper.fromFeatureResidentsResponseDataModel(featureResponseModel);
  }
}