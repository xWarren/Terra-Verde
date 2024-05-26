import '../../../../core/data/repositories/login_repository.dart';
import '../../../../core/data/source/login_remote_source.dart';
import '../../../../core/domain/entities/login_entity.dart';
import '../../domain/payload/login_param.dart';
import '../../mapper/login_mapper.dart';


class LoginRepositoryImpl implements LoginRepository {

  LoginRepositoryImpl({
    required this.remoteSource
  });

  final LoginRemoteSource remoteSource;

  @override
  Future<LoginEntity> login(LoginParam param) async {
    var response = await remoteSource.login(param.toJson());
    var featureEntity = LoginMapper.fromLoginResponseModel(response);
    var entity = LoginMapper.fromFeatureLoginEntity(featureEntity);
    return entity;
  }
}