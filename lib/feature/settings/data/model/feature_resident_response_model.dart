class FeatureResidentResponseModel {

  final int id;
  final String email;
  final String residentId;
  final String firstName;
  final String lastName;
  final String address;
  final String profileImage;

  const FeatureResidentResponseModel({
    required this.id,
    required this.email,
    required this.residentId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.profileImage
  });

  factory FeatureResidentResponseModel.fromJson(Map<String, dynamic>? json) => FeatureResidentResponseModel(
    id: json?["id"] ?? 0,
    residentId: json?["residentCode"] ?? "",
    firstName: json?["firstName"] ?? "",
    lastName: json?["lastName"] ?? "",
    email: json?["email"] ?? 0,    
    address: json?["address"] ?? "",
    profileImage: json?["profileImage"] ?? "",             
  );
}