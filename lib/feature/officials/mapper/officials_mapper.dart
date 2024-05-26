import '../../../core/data/model/officials_response_model.dart';
import '../../../core/domain/entities/officials_entity.dart';
import '../data/model/feature_officials_response_model.dart';
import '../domain/entities/feature_officials_entity.dart';

class OfficialsMapper {

  static OfficialsResponseModel fromFeatureOfficialsResponseModel(FeatureOfficialsResponseModel model) {
    
    return OfficialsResponseModel(
      id: model.id,
      name: model.name,
      position: model.position,
      contacts: model.contacts
    );
  }

  static FeatureOfficialsEntity fromOfficialsResponseModel(OfficialsResponseModel model) {
    
    return FeatureOfficialsEntity(
      id: model.id,
      name: model.name,
      position: model.position,
      contacts: model.contacts
    );
  }

    static OfficialsEntity fromFeatureOfficialsEntity(FeatureOfficialsEntity entity) {
    
    return OfficialsEntity(
      id: entity.id,
      name: entity.name,
      position: entity.position,
      contacts: entity.contacts
    );
  }
}