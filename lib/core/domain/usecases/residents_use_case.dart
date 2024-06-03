import '../entities/residents_data_entity.dart';

abstract class ResidentsUseCase {

  Future<List<ResidentsDataEntity>> getResidents();
  Future<ResidentsDataEntity> getIdFromResidents({required int id});
}