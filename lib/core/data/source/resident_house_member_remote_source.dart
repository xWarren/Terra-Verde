import '../model/add_resident_response_model.dart';
import '../model/get_resident_house_member_data_model.dart';
import '../model/get_resident_house_member_response_model.dart';

abstract class ResidentHouseMemberRemoteSource {

  Future<GetResidentHouseMemberResponseModel> getResidents();
  Future<GetResidentHouseMemberDataModel> getIdFromResidents({required int id});
  Future<AddResidentResponseModel> addResident(body);
  Future<AddResidentResponseModel> editProfile(body);
  Future<AddResidentResponseModel> deleteResidentHouseMember({required int id});
}