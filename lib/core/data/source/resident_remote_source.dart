import '../model/add_resident_response_model.dart';
import '../model/get_resident_response_model.dart';

abstract class ResidentRemoteSource {

  Future<GetResidentResponseModel> getResident({required int id});
  Future<AddResidentResponseModel> editProfile({
    body,
    required int id,
    required int residentId,
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String address,
    required String profileImage,
    required String password
  });
}