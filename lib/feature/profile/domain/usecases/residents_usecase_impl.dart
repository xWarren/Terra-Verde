import '../../../../core/data/repositories/residents_repository.dart';
import '../../../../core/domain/entities/residents_data_entity.dart';
import '../../../../core/domain/usecases/residents_use_case.dart';
import '../payload/get_id_residents_param.dart';

class ResidentsUseCaseImpl implements ResidentsUseCase {

  ResidentsUseCaseImpl({
    required this.residentsRepository
  });

  final ResidentsRepository residentsRepository;

  @override
  Future<List<ResidentsDataEntity>> getResidents() {

    return residentsRepository.getResidents();
  }
  
  @override
  Future<ResidentsDataEntity> getIdFromResidents({required int id}) {

    var param = GetIdResidentsParam(
      id: id
    );

    return residentsRepository.getIdFromResidents(param);
  }
}