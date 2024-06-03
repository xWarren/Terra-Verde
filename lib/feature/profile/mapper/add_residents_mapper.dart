import '../../../core/data/model/get_residents_response_data_model.dart';
import '../../../core/data/model/get_residents_response_model.dart';
import '../data/model/feature_residents_response_model.dart';
import 'add_residents_data_mapper.dart';

class AddResidentsMapper {

  static GetResidentsResponseModel fromFeatureResidentsResponseModel(FeatureResidentsResponseModel model) {
    
    return GetResidentsResponseModel(
      data: model.data.map<GetResidentsResponseDataModel>((e) => AddResidentsDataMapper.fromFeatureResidentsResponseDataModel(e)).toList()
    );
  }
}