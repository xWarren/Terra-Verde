import '../../../../core/data/repositories/officials_repository.dart';
import '../../../../core/domain/entities/officials_entity.dart';
import '../../../../core/domain/usecases/officials_usecase.dart';

class OfficialsUseCaseImpl implements OfficialsUseCase {

  OfficialsUseCaseImpl({
    required this.officialsRepository
  });

  final OfficialsRepository officialsRepository;

  @override
  Future<OfficialsEntity> execute() {

    return officialsRepository.officials();
  }
}