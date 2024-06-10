import '../entities/add_resident_entity.dart';
import '../entities/residents_data_entity.dart';

abstract class ResidentsUseCase {

  Future<List<ResidentsDataEntity>> getResidents();
  Future<ResidentsDataEntity> getIdFromResidents({required int id});
  Future<AddResidentEntity> addResident({
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