import '../../../core/data/model/login_response_model.dart';
import '../../../core/domain/entities/login_entity.dart';
import '../data/model/feature_login_response_model.dart';
import '../domain/entities/feature_login_entity.dart';

class LoginMapper {

  static LoginResponseModel fromFeatureLoginResponseModel(FeatureLoginResponseModel model) {
    
    return LoginResponseModel(
      message: model.message,
      referenceKey: model.referenceKey,
      code: model.code,
      codeInfo: model.codeInfo,
      errors: model.errors,
      token: model.token,
      userName: model.userName,
      profileImage: model.profileImage,
      firstName: model.firstName,
      lastName: model.lastName,
      email: model.email,
      id: model.id,
      residentId: model.residentId
    );
  }

  static FeatureLoginEntity fromLoginResponseModel(LoginResponseModel model) {
    
    return FeatureLoginEntity(
      message: model.message,
      referenceKey: model.referenceKey,
      code: model.code,
      codeInfo: model.codeInfo,
      errors: model.errors,
      token: model.token,
      userName: model.userName,
      profileImage: model.profileImage,
      firstName: model.firstName,
      lastName: model.lastName,
      email: model.email,
      id: model.id,
      residentId: model.residentId
    );
  }

    static LoginEntity fromFeatureLoginEntity(FeatureLoginEntity entity) {
    
    return LoginEntity(
      message: entity.message,
      referenceKey: entity.referenceKey,
      code: entity.code,
      codeInfo: entity.codeInfo,
      errors: entity.errors,
      token: entity.token,
      userName: entity.userName,
      profileImage: entity.profileImage,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      id: entity.id,
      residentId: entity.residentId
    );
  }
}