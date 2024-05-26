import '../model/officials_response_model.dart';

abstract class OfficialsRemoteSource {

  Future<OfficialsResponseModel> officials();
}