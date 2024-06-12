class FeatureAddBookmarkResponseModel {

  final int message;

  const FeatureAddBookmarkResponseModel({
    required this.message
  });

  factory FeatureAddBookmarkResponseModel.fromJson(int json) => const FeatureAddBookmarkResponseModel(
     message: 0,
  );
}