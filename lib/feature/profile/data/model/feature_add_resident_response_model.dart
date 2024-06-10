class FeatureAddResidentResponseModel {

  final int message;

  const FeatureAddResidentResponseModel({
    required this.message
  });

  factory FeatureAddResidentResponseModel.fromJson(int json) => const FeatureAddResidentResponseModel(
     message: 0,
  );
}