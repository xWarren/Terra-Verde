import '../entities/resident_entity.dart';

abstract class ResidentUseCase {

  Future<ResidentEntity> getResident({required int id});
}