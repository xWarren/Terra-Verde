class FeatureAddResidentResponseModel {

  final String message;

  const FeatureAddResidentResponseModel({
    required this.message
  });

  factory FeatureAddResidentResponseModel.fromJson(Map<String, dynamic>? json) => FeatureAddResidentResponseModel(
     message: json?[""] ?? "",
  );
}