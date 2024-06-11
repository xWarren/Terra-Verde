import '../../../../core/data/repositories/resident_repository.dart';
import '../../../../core/domain/entities/resident_entity.dart';
import '../../../../core/domain/usecases/resident_usecase.dart';
import '../payload/resident_param.dart';

class ResidentUseCaseImpl implements ResidentUseCase {

  ResidentUseCaseImpl({
    required this.residentRepository
  });

  final ResidentRepository residentRepository;

  @override
  Future<ResidentEntity> getResident({required int id}) {
     var param = ResidentParam(
      id: id
    );

    return residentRepository.getResident(param);
  }
}