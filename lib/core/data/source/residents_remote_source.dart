import '../model/get_residents_response_data_model.dart';
import '../model/get_residents_response_model.dart';

abstract class ResidentsRemoteSource {

  Future<GetResidentsResponseModel> getResidents();
  Future<GetResidentsResponseDataModel> getIdFromResidents({required int id});
}