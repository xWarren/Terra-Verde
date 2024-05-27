import '../../../../core/data/repositories/officials_repository.dart';
import '../../../../core/data/source/officials_remote_source.dart';
import '../../../../core/domain/entities/officials_data_entity.dart';
import '../../domain/entities/feature_officials_data_entity.dart';
import '../../mapper/officials_data_mapper.dart';


class OfficialsRepositoryImpl implements OfficialsRepository {

  OfficialsRepositoryImpl({
    required this.remoteSource
  });

  final OfficialsRemoteSource remoteSource;

  @override
  Future<List<OfficialsDataEntity>> officials() async {
    var response = await remoteSource.officials();
    var featureEntity = response.data.map<FeatureOfficialsDataEntity>((e) => OfficialsDataMapper.fromOfficialsResponseDataModel(e)).toList();
    var entity = featureEntity.map<OfficialsDataEntity>((e) => OfficialsDataMapper.fromFeatureOfficialsDataEntity(e)).toList();
    return entity;
  }
}