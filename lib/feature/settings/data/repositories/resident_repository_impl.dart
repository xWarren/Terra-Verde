import '../../../../core/data/repositories/resident_repository.dart';
import '../../../../core/data/source/resident_remote_source.dart';
import '../../../../core/domain/entities/resident_entity.dart';
import '../../domain/payload/resident_param.dart';
import '../../mapper/get_resident_mapper.dart';

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
}