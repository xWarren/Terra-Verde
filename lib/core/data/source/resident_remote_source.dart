import '../model/get_resident_response_model.dart';

abstract class ResidentRemoteSource {

  Future<GetResidentResponseModel> getResident({required int id});
}