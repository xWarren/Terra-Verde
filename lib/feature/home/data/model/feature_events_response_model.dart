import 'feature_events_response_data_model.dart';

class FeatureEventsResponseModel {

  final List<FeatureEventsResponseDataModel> data;

  const FeatureEventsResponseModel({
    required this.data
  });

  factory FeatureEventsResponseModel.fromJson(List<dynamic> json) => FeatureEventsResponseModel(
    data: json.map((e) => FeatureEventsResponseDataModel.fromJson(e)).toList()
  );
}