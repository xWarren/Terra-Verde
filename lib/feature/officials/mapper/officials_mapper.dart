import '../../../core/data/model/officials_response_data_model.dart';
import '../../../core/data/model/officials_response_model.dart';
import '../data/model/feature_officials_response_model.dart';
import 'officials_data_mapper.dart';

class OfficialsMapper {

  static OfficialsResponseModel fromFeatureOfficialsResponseModel(FeatureOfficialsResponseModel model) {
    
    return OfficialsResponseModel(
      data: model.data.map<OfficialsResponseDataModel>((e) => OfficialsDataMapper.fromFeatureOfficialsResponseDataModel(e)).toList()
    );
  }
}