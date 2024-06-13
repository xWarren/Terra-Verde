import '../../../../core/data/repositories/resident_repository.dart';
import '../../../../core/data/source/resident_remote_source.dart';
import '../../../../core/domain/entities/add_resident_entity.dart';
import '../../../../core/domain/entities/resident_entity.dart';
import '../../../settings/domain/payload/resident_param.dart';
import '../../../settings/mapper/get_resident_mapper.dart';
import '../../domain/payload/edit_head_family_param.dart';
import '../../mapper/add_resident_mapper.dart';

class ResidentRepositoryImpl implements ResidentRepository {

  ResidentRepositoryImpl({
    required this.remoteSource
  });

  final ResidentRemoteSource remoteSource;


  @override
  Future<ResidentEntity> getResident(ResidentParam param) async {
    var response = await remoteSource.getResident(id: param.id);
    var featureEntity = GetResidentMapper.fromGetResidentResponseModel(response);
    var entity = GetResidentMapper.fromFeatureResidentEntity(featureEntity);
    return entity;
  }

  @override
  Future<AddResidentEntity> editProfile(EditHeadFamilyParam param) async {
    var response = await remoteSource.editProfile(
      id: param.id, 
      residentId: param.residentId, 
      firstName: param.firstName, 
      lastName: param.lastName, 
      emailAddress: param.emailAddress, 
      address: param.address, 
      profileImage: param.profileImage, 
      password: param.password  
    );
    var featureEntity = AddResidentMapper.fromAddResidentResponseModel(response);
    var entity = AddResidentMapper.fromFeatureAddResidentDataEntity(featureEntity);
    return entity;
  }
}