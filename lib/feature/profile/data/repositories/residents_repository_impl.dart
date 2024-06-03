import '../../../../core/data/repositories/residents_repository.dart';
import '../../../../core/data/source/residents_remote_source.dart';
import '../../../../core/domain/entities/residents_data_entity.dart';
import '../../domain/entities/feature_residents_data_entity.dart';
import '../../domain/payload/add_residents_param.dart';
import '../../mapper/add_residents_data_mapper.dart';

class ResidentsRepositoryImpl implements ResidentsRepository {

  ResidentsRepositoryImpl({
    required this.remoteSource
  });

  final ResidentsRemoteSource remoteSource;

  @override
  Future<List<ResidentsDataEntity>> getResidents() async {
    var response = await remoteSource.getResidents();
    var featureEntity = response.data.map<FeatureResidentsDataEntity>((e) => AddResidentsDataMapper.fromGetResidentsResponseDataModel(e)).toList();
    var entity = featureEntity.map<ResidentsDataEntity>((e) => AddResidentsDataMapper.fromFeatureResidentsDataEntity(e)).toList();
    return entity;
  }

  @override
  Future<ResidentsDataEntity> getIdFromResidents(AddResidentsParam param) async {
    var response = await remoteSource.getIdFromResidents(id: param.id);
    var featureEntity = AddResidentsDataMapper.fromGetResidentsResponseDataModel(response);
    var entity = AddResidentsDataMapper.fromFeatureResidentsDataEntity(featureEntity);
    return entity;
  }
}