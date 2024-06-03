import 'feature_announcement_response_data_model.dart';

class FeatureAnnouncementResponseModel {

  final List<FeatureAnnouncementResponseDataModel> data;

  const FeatureAnnouncementResponseModel({
    required this.data
  });

  factory FeatureAnnouncementResponseModel.fromJson(List<dynamic> json) => FeatureAnnouncementResponseModel(
    data: json.map((e) => FeatureAnnouncementResponseDataModel.fromJson(e)).toList()
  );
}