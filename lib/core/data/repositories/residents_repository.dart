import '../../../feature/profile/domain/payload/add_residents_param.dart';
import '../../domain/entities/residents_data_entity.dart';

abstract class ResidentsRepository {

  Future<List<ResidentsDataEntity>> getResidents(); 
  Future<ResidentsDataEntity> getIdFromResidents(AddResidentsParam param);
}