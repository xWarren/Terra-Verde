import 'feature_residents_response_data_model.dart';

class FeatureResidentsResponseModel {

  final List<FeatureResidentsResponseDataModel> data;

  const FeatureResidentsResponseModel({
    required this.data
  });

  factory FeatureResidentsResponseModel.fromJson(List<dynamic> json) => FeatureResidentsResponseModel(
    data: json.map((e) => FeatureResidentsResponseDataModel.fromJson(e)).toList()
  );
}