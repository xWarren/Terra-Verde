import '../../domain/entities/officials_data_entity.dart';

abstract class OfficialsRepository {

  Future<List<OfficialsDataEntity>> officials(); 
}