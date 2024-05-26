import '../../../../core/data/repositories/login_repository.dart';
import '../../../../core/domain/entities/login_entity.dart';
import '../../../../core/domain/usecases/login_usecase.dart';
import '../payload/login_param.dart';

class LoginUseCaseImpl implements LoginUseCase {

  LoginUseCaseImpl({
    required this.loginRepository
  });

  final LoginRepository loginRepository;

  @override
  Future<LoginEntity> execute({required String email, required String password}) {
    
    var param = LoginParam(
      email: email,
      password: password
    );

    return loginRepository.login(param);
  }
}