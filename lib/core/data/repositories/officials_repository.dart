import '../../domain/entities/officials_entity.dart';

abstract class OfficialsRepository {

  Future<OfficialsEntity> officials(); 
}