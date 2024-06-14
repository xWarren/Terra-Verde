import '../model/add_resident_response_model.dart';
import '../model/get_resident_house_member_data_model.dart';
import '../model/get_resident_house_member_response_model.dart';

abstract class ResidentHouseMemberRemoteSource {

  Future<GetResidentHouseMemberResponseModel> getResidents();
  Future<GetResidentHouseMemberDataModel> getIdFromResidents({required int id});
  Future<AddResidentResponseModel> addResident({
    body,
    required int residentId,
    required String firstName,
    required String middleName,
    required String lastName,
    required int contactNumber,
    required String emailAddress,
    required String address,
    required String birthDate,
    required String gender,
    required String profileImage,
    required String relationship,
    required String password
  });
  Future<AddResidentResponseModel> editProfile({
    body,
    required int id,
    required int residentId,
    required String firstName,
    required String middleName,
    required String lastName,
    required int contactNumber,
    required String emailAddress,
    required String address,
    required String birthDate,
    required String gender,
    required String profileImage,
    required String relationship,
    required String password
 });
  Future<AddResidentResponseModel> deleteResidentHouseMember({required int id});
}