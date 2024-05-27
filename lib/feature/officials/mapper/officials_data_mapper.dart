import '../../../core/data/model/officials_response_data_model.dart';
import '../../../core/domain/entities/officials_data_entity.dart';
import '../data/model/feature_officials_response_data_model.dart';
import '../domain/entities/feature_officials_data_entity.dart';

class OfficialsDataMapper {

  static OfficialsResponseDataModel fromFeatureOfficialsResponseDataModel(FeatureOfficialsResponseDataModel model) {
    
    return OfficialsResponseDataModel(
      id: model.id,
      name: model.name,
      position: model.position,
      contacts: model.contacts,
      image: model.image
    );
  }

  static FeatureOfficialsDataEntity fromOfficialsResponseDataModel(OfficialsResponseDataModel model) {
    
    return FeatureOfficialsDataEntity(
      id: model.id,
      name: model.name,
      position: model.position,
      contacts: model.contacts,
      image: model.image
    );
  }

    static OfficialsDataEntity fromFeatureOfficialsDataEntity(FeatureOfficialsDataEntity entity) {
    
    return OfficialsDataEntity(
      id: entity.id,
      name: entity.name,
      position: entity.position,
      contacts: entity.contacts,
      image: entity.image
    );
  }
}