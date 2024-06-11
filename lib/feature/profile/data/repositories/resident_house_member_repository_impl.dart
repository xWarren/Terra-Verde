import '../../../../core/data/repositories/resident_house_member_repository.dart';
import '../../../../core/data/source/resident_house_member_remote_source.dart';
import '../../../../core/domain/entities/add_resident_entity.dart';
import '../../../../core/domain/entities/resident_house_member_data_entity.dart';
import '../../domain/entities/feature_resident_house_member_data_entity.dart';
import '../../domain/payload/add_resident_house_member_param.dart';
import '../../domain/payload/edit_profile_param.dart';
import '../../domain/payload/get_id_resident_house_member_param.dart';
import '../../mapper/add_resident_mapper.dart';
import '../../mapper/get_resident_house_member_data_mapper.dart';

class ResidentHouseMemberRepositoryImpl implements ResidentHouseMemberRepository {

  ResidentHouseMemberRepositoryImpl({
    required this.remoteSource
  });

  final ResidentHouseMemberRemoteSource remoteSource;

  @override
  Future<List<ResidentHouseMemberDataEntity>> getResidentHouseMember() async {
    var response = await remoteSource.getResidents();
    var featureEntity = response.data.map<FeatureResidentHouseMemberDataEntity>((e) => GetResidentHouseMemberDataMapper.fromGetResidentsResponseDataModel(e)).toList();
    var entity = featureEntity.map<ResidentHouseMemberDataEntity>((e) => GetResidentHouseMemberDataMapper.fromFeatureResidentHouseMemberDataEntity(e)).toList();
    return entity;
  }

  @override
  Future<ResidentHouseMemberDataEntity> getIdFromResidentHouseMember(GetIdResidentHouseMemberParam param) async {
    var response = await remoteSource.getIdFromResidents(id: param.id);
    var featureEntity = GetResidentHouseMemberDataMapper.fromGetResidentsResponseDataModel(response);
    var entity = GetResidentHouseMemberDataMapper.fromFeatureResidentHouseMemberDataEntity(featureEntity);
    return entity;
  }

  @override
  Future<AddResidentEntity> addResidentHouseMember(AddResidentHouseMemberParam param) async {
    var response = await remoteSource.addResident(param.toJson());
    var featureEntity = AddResidentMapper.fromAddResidentResponseModel(response);
    var entity = AddResidentMapper.fromFeatureAddResidentDataEntity(featureEntity);
    return entity;
  }

  @override
  Future<AddResidentEntity> editProfile(EditProfileParam param) async {
    var response = await remoteSource.editProfile(param.toJson());
    var featureEntity = AddResidentMapper.fromAddResidentResponseModel(response);
    var entity = AddResidentMapper.fromFeatureAddResidentDataEntity(featureEntity);
    return entity;
  }
}