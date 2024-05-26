import '../../../../core/data/model/login_response_model.dart';
import '../../../../core/data/source/login_remote_source.dart';
import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/resources/api_endpoint.dart';
import '../../../../core/utils/base_get_connect.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../mapper/login_mapper.dart';
import '../model/feature_login_response_model.dart';

class LoginRemoteSourceImpl extends BaseGetConnect implements LoginRemoteSource {

  LoginRemoteSourceImpl({
    required this.storageService
  });

  final StorageService storageService;

  @override
  Future<LoginResponseModel> login(body) async {
    var response = await methodRequest(
      APIEndpoint.login,
      method: Method.post,
      params: body,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureLoginResponseModel.fromJson(response.body);
    return LoginMapper.fromFeatureLoginResponseModel(featureResponseModel);
  }
}