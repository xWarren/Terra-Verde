import '../../../core/data/model/get_residents_response_data_model.dart';
import '../../../core/domain/entities/residents_data_entity.dart';
import '../data/model/feature_residents_response_data_model.dart';
import '../domain/entities/feature_residents_data_entity.dart';

class GetResidentsDataMapper {

  static GetResidentsResponseDataModel fromFeatureResidentsResponseDataModel(FeatureResidentsResponseDataModel model) {
    
    return GetResidentsResponseDataModel(
      id: model.id,
      residentId: model.residentId,
      firstName: model.firstName,
      middleName: model.middleName,
      lastName: model.lastName,
      contactNumber: model.contactNumber,
      emailAddress: model.emailAddress,
      address: model.address,
      birthDate: model.birthDate,
      gender: model.gender,
      profileImage: model.profileImage,
      relationship: model.relationship
    );
  }

  static FeatureResidentsDataEntity fromGetResidentsResponseDataModel(GetResidentsResponseDataModel model) {
    
    return FeatureResidentsDataEntity(
      id: model.id,
      residentId: model.residentId,
      firstName: model.firstName,
      middleName: model.middleName,
      lastName: model.lastName,
      contactNumber: model.contactNumber,
      emailAddress: model.emailAddress,
      address: model.address,
      birthDate: model.birthDate,
      gender: model.gender,
      profileImage: model.profileImage,
      relationship: model.relationship
    );
  }

    static ResidentsDataEntity fromFeatureResidentsDataEntity(FeatureResidentsDataEntity entity) {
    
    return ResidentsDataEntity(
      id: entity.id,
      residentId: entity.residentId,
      firstName: entity.firstName,
      middleName: entity.middleName,
      lastName: entity.lastName,
      contactNumber: entity.contactNumber,
      emailAddress: entity.emailAddress,
      address: entity.address,
      birthDate: entity.birthDate,
      gender: entity.gender,
      profileImage: entity.profileImage,
      relationship: entity.relationship
    );
  }
}