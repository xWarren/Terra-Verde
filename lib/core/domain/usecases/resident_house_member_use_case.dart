import '../entities/add_resident_entity.dart';
import '../entities/resident_house_member_data_entity.dart';

abstract class ResidentHouseMemberUseCase {

  Future<List<ResidentHouseMemberDataEntity>> getResidentHouseMember();
  Future<ResidentHouseMemberDataEntity> getIdFromResidentHouseMember({required int id});
  Future<AddResidentEntity> addResidentHouseMember({
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
  Future<AddResidentEntity> editProfile({
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
}