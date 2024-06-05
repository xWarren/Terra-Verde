class FeatureOfficialsResponseDataModel {

  final int id;
  final String name;
  final String position;
  final int contacts;
  final String image;

  const FeatureOfficialsResponseDataModel({
    required this.id,
    required this.name,
    required this.position,
    required this.contacts,
    required this.image
  });

  factory FeatureOfficialsResponseDataModel.fromJson(Map<String, dynamic>? json) => FeatureOfficialsResponseDataModel(
    id: json?["id"] ?? 0,
    name: json?["name"] ?? "",
    position: json?["position"] ?? "",
    contacts: json?["contacts"] ?? 0,
    image: json?["image"] ?? ""
  );
}