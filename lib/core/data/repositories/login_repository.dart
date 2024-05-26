import '../../../feature/login/domain/payload/login_param.dart';
import '../../domain/entities/login_entity.dart';

abstract class LoginRepository {

  Future<LoginEntity> login(LoginParam param); 
}