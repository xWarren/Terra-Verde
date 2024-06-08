import '../../../core/data/model/add_resident_response_model.dart';
import '../../../core/domain/entities/add_resident_entity.dart';
import '../data/model/feature_add_resident_response_model.dart';
import '../domain/entities/feature_add_resident_entity.dart';

class AddResidentMapper {

  static AddResidentResponseModel fromFeatureAddResidentResponseModel(FeatureAddResidentResponseModel model) {
    
    return AddResidentResponseModel(
      message: model.message
    );
  }

  static FeatureAddResidentDataEntity fromAddResidentResponseModel(AddResidentResponseModel model) {
    
    return FeatureAddResidentDataEntity(
      message: model.message
    );
  }

    static AddResidentEntity fromFeatureAddResidentDataEntity(FeatureAddResidentDataEntity entity) {
    
    return AddResidentEntity(
      message: entity.message
    );
  }
}