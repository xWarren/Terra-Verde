import '../entities/add_resident_entity.dart';
import '../entities/resident_entity.dart';

abstract class ResidentUseCase {

  Future<ResidentEntity> getResident({required int id});

  Future<AddResidentEntity> editProfile({
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