class FeatureOfficialsResponseModel {

  final int id;
  final String name;
  final String position;
  final int contacts;

  const FeatureOfficialsResponseModel({
    required this.id,
    required this.name,
    required this.position,
    required this.contacts
  });

  factory FeatureOfficialsResponseModel.fromJson(Map<String, dynamic>? json) => FeatureOfficialsResponseModel(
    id: json?["id"] ?? 0,
    name: json?["name"] ?? "",
    position: json?["position"] ?? "",
    contacts: json?["contacts"] ?? 0,
  );
}