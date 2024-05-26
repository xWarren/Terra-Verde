import '../model/login_response_model.dart';

abstract class LoginRemoteSource {

  Future<LoginResponseModel> login(body);
}