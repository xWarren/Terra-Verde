import 'feature_officials_response_data_model.dart';

class FeatureOfficialsResponseModel {

  final List<FeatureOfficialsResponseDataModel> data;

  const FeatureOfficialsResponseModel({
    required this.data
  });

  factory FeatureOfficialsResponseModel.fromJson(List<dynamic> json) => FeatureOfficialsResponseModel(
    data: json.map((e) => FeatureOfficialsResponseDataModel.fromJson(e)).toList()
  );
}