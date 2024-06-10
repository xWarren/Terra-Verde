import '../../../feature/profile/domain/payload/add_residents_param.dart';
import '../../../feature/profile/domain/payload/edit_profile_param.dart';
import '../../../feature/profile/domain/payload/get_id_residents_param.dart';
import '../../domain/entities/add_resident_entity.dart';
import '../../domain/entities/residents_data_entity.dart';

abstract class ResidentsRepository {

  Future<List<ResidentsDataEntity>> getResidents(); 
  Future<ResidentsDataEntity> getIdFromResidents(GetIdResidentsParam param);
  Future<AddResidentEntity> addResident(AddResidentsParam param);
  Future<AddResidentEntity> editProfile(EditProfileParam param);
}