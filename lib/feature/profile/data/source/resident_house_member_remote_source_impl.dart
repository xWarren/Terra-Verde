import '../../../../core/data/model/add_resident_response_model.dart';
import '../../../../core/data/model/get_resident_house_member_data_model.dart';
import '../../../../core/data/model/get_resident_house_member_response_model.dart';
import '../../../../core/data/source/resident_house_member_remote_source.dart';
import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/resources/api_endpoint.dart';
import '../../../../core/utils/base_get_connect.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../mapper/add_resident_mapper.dart';
import '../../mapper/get_resident_house_member_data_mapper.dart';
import '../../mapper/get_resident_house_member_mapper.dart';
import '../model/feature_add_resident_response_model.dart';
import '../model/feature_resident_house_member_data_model.dart';
import '../model/feature_resident_house_member_response_model.dart';

class ResidentHouseMemberRemoteSourceImpl extends BaseGetConnect implements ResidentHouseMemberRemoteSource {

  ResidentHouseMemberRemoteSourceImpl({
    required this.storageService
  });

  final StorageService storageService;

  @override
  Future<GetResidentHouseMemberResponseModel> getResidents() async {
    var response = await methodRequest(
      APIEndpoint.residentsHouseMembers,
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureResidentHouseMemberResponseModel.fromJson(response.body);
    return GetResidentHouseMemberMapper.fromFeatureResidentHouseMemberResponseModel(featureResponseModel);
  }

  @override
  Future<GetResidentHouseMemberDataModel> getIdFromResidents({required int id}) async {
    var response = await methodRequest(
      "${APIEndpoint.residentsHouseMembers}/$id",
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureResidentHouseMemberDataModel.fromJson(response.body);
    return GetResidentHouseMemberDataMapper.fromFeatureResidentHouseMemberDataModel(featureResponseModel);
  }

    @override
  Future<AddResidentResponseModel> addResident(body) async {
    var response = await methodRequest(
      APIEndpoint.residentsHouseMembers,
      method: Method.post,
      params: body,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureAddResidentResponseModel.fromJson(response.body);
    return AddResidentMapper.fromFeatureAddResidentResponseModel(featureResponseModel);
  }
  
  @override
  Future<AddResidentResponseModel> editProfile(body) async {
    var response = await methodRequest(
      APIEndpoint.residentsHouseMembers,
      method: Method.put,
      params: body,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureAddResidentResponseModel.fromJson(response.body);
    return AddResidentMapper.fromFeatureAddResidentResponseModel(featureResponseModel);
  }
}