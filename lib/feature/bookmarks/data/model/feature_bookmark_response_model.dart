import 'feature_bookmark_response_data_model.dart';

class FeatureBookmarkResponseModel {

  final List<FeatureBookmarkResponseDataModel> data;

  const FeatureBookmarkResponseModel({
    required this.data
  });

  factory FeatureBookmarkResponseModel.fromJson(List<dynamic> json) => FeatureBookmarkResponseModel(
    data: json.map((e) => FeatureBookmarkResponseDataModel.fromJson(e)).toList()
  );
}