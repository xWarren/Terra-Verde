import '../../../feature/settings/domain/payload/resident_param.dart';
import '../../domain/entities/resident_entity.dart';

abstract class ResidentRepository {

  Future<ResidentEntity> getResident(ResidentParam param);
}