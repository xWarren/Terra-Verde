import '../entities/officials_data_entity.dart';

abstract class OfficialsUseCase {

  Future<List<OfficialsDataEntity>> execute();
}