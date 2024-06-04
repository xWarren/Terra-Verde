import '../../../feature/profile/domain/payload/get_id_residents_param.dart';
import '../../domain/entities/residents_data_entity.dart';

abstract class ResidentsRepository {

  Future<List<ResidentsDataEntity>> getResidents(); 
  Future<ResidentsDataEntity> getIdFromResidents(GetIdResidentsParam param);
}