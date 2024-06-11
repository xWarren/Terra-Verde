import '../../../core/data/model/get_resident_house_member_data_model.dart';
import '../../../core/domain/entities/resident_house_member_data_entity.dart';
import '../data/model/feature_resident_house_member_data_model.dart';
import '../domain/entities/feature_resident_house_member_data_entity.dart';

class GetResidentHouseMemberDataMapper {

  static GetResidentHouseMemberDataModel fromFeatureResidentHouseMemberDataModel(FeatureResidentHouseMemberDataModel model) {
    
    return GetResidentHouseMemberDataModel(
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

  static FeatureResidentHouseMemberDataEntity fromGetResidentsResponseDataModel(GetResidentHouseMemberDataModel model) {
    
    return FeatureResidentHouseMemberDataEntity(
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

    static ResidentHouseMemberDataEntity fromFeatureResidentHouseMemberDataEntity(FeatureResidentHouseMemberDataEntity entity) {
    
    return ResidentHouseMemberDataEntity(
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