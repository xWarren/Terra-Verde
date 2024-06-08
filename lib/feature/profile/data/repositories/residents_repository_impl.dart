import 'package:terra_verde/core/domain/entities/add_resident_entity.dart';

import 'package:terra_verde/feature/profile/domain/payload/add_residents_param.dart';

import '../../../../core/data/repositories/residents_repository.dart';
import '../../../../core/data/source/residents_remote_source.dart';
import '../../../../core/domain/entities/residents_data_entity.dart';
import '../../domain/entities/feature_residents_data_entity.dart';
import '../../domain/payload/get_id_residents_param.dart';
import '../../mapper/add_resident_mapper.dart';
import '../../mapper/get_residents_data_mapper.dart';

class ResidentsRepositoryImpl implements ResidentsRepository {

  ResidentsRepositoryImpl({
    required this.remoteSource
  });

  final ResidentsRemoteSource remoteSource;

  @override
  Future<List<ResidentsDataEntity>> getResidents() async {
    var response = await remoteSource.getResidents();
    var featureEntity = response.data.map<FeatureResidentsDataEntity>((e) => GetResidentsDataMapper.fromGetResidentsResponseDataModel(e)).toList();
    var entity = featureEntity.map<ResidentsDataEntity>((e) => GetResidentsDataMapper.fromFeatureResidentsDataEntity(e)).toList();
    return entity;
  }

  @override
  Future<ResidentsDataEntity> getIdFromResidents(GetIdResidentsParam param) async {
    var response = await remoteSource.getIdFromResidents(id: param.id);
    var featureEntity = GetResidentsDataMapper.fromGetResidentsResponseDataModel(response);
    var entity = GetResidentsDataMapper.fromFeatureResidentsDataEntity(featureEntity);
    return entity;
  }

  @override
  Future<AddResidentEntity> addResident(AddResidentsParam param) async {
    var response = await remoteSource.addResident(param.toJson());
    var featureEntity = AddResidentMapper.fromAddResidentResponseModel(response);
    var entity = AddResidentMapper.fromFeatureAddResidentDataEntity(featureEntity);
    return entity;
  }
}