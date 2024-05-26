import '../entities/officials_entity.dart';

abstract class OfficialsUseCase {

  Future<OfficialsEntity> execute();
}