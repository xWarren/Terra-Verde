import '../../../feature/profile/domain/payload/add_resident_house_member_param.dart';
import '../../../feature/profile/domain/payload/delete_resident_house_member_param.dart';
import '../../../feature/profile/domain/payload/edit_profile_param.dart';
import '../../../feature/profile/domain/payload/get_id_resident_house_member_param.dart';
import '../../domain/entities/add_resident_entity.dart';
import '../../domain/entities/resident_house_member_data_entity.dart';

abstract class ResidentHouseMemberRepository {

  Future<List<ResidentHouseMemberDataEntity>> getResidentHouseMember(); 
  Future<ResidentHouseMemberDataEntity> getIdFromResidentHouseMember(GetIdResidentHouseMemberParam param);
  Future<AddResidentEntity> addResidentHouseMember(AddResidentHouseMemberParam param);
  Future<AddResidentEntity> editProfile(EditProfileParam param);
  Future<AddResidentEntity> deleteResidentHouseMember(DeleteResidentHouseMemberParam param);
}