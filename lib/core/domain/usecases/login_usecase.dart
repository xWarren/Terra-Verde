import '../entities/login_entity.dart';

abstract class LoginUseCase {

  Future<LoginEntity> execute({required String email, required String password});
}