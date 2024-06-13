import '../../../feature/profile/domain/payload/edit_head_family_param.dart';
import '../../../feature/settings/domain/payload/resident_param.dart';
import '../../domain/entities/add_resident_entity.dart';
import '../../domain/entities/resident_entity.dart';

abstract class ResidentRepository {

  Future<ResidentEntity> getResident(ResidentParam param);
  Future<AddResidentEntity> editProfile(EditHeadFamilyParam param);
}