import '../../../core/data/model/get_resident_response_model.dart';
import '../../../core/domain/entities/resident_entity.dart';
import '../data/model/feature_resident_response_model.dart';
import '../domain/entities/feature_resident_entity.dart';

class GetResidentMapper {

  static GetResidentResponseModel fromFeatureResidentResponseModel(FeatureResidentResponseModel model) {
    
    return GetResidentResponseModel(
      id: model.id,
      residentId: model.residentId,
      firstName: model.firstName,
      lastName: model.lastName,
      email: model.email,
      address: model.address,
      profileImage: model.profileImage
    );
  }

  static FeatureResidentEntity fromGetResidentResponseModel(GetResidentResponseModel model) {
    
    return FeatureResidentEntity(
      id: model.id,
      residentId: model.residentId,
      firstName: model.firstName,
      lastName: model.lastName,
      email: model.email,
      address: model.address,
      profileImage: model.profileImage
    );
  }

    static ResidentEntity fromFeatureResidentEntity(FeatureResidentEntity entity) {
    
    return ResidentEntity(
      id: entity.id,
      residentId: entity.residentId,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      address: entity.address,
      profileImage: entity.profileImage
    );
  }
}