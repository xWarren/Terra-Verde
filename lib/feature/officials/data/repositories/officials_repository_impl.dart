import '../../../../core/data/repositories/officials_repository.dart';
import '../../../../core/data/source/officials_remote_source.dart';
import '../../../../core/domain/entities/officials_entity.dart';
import '../../mapper/officials_mapper.dart';


class OfficialsRepositoryImpl implements OfficialsRepository {

  OfficialsRepositoryImpl({
    required this.remoteSource
  });

  final OfficialsRemoteSource remoteSource;

  @override
  Future<OfficialsEntity> officials() async {
    var response = await remoteSource.officials();
    var featureEntity = OfficialsMapper.fromOfficialsResponseModel(response);
    var entity = OfficialsMapper.fromFeatureOfficialsEntity(featureEntity);
    return entity;
  }
}