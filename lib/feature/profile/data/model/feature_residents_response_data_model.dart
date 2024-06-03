class FeatureResidentsResponseDataModel {

  final int id;
  final int residentId;
  final String firstName;
  final String middleName;
  final String lastName;
  final int contactNumber;
  final String emailAddress;
  final String address;
  final String birthDate;
  final String gender;
  final String profileImage;

  const FeatureResidentsResponseDataModel({
    required this.id,
    required this.residentId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.contactNumber,
    required this.emailAddress,
    required this.address,
    required this.birthDate,
    required this.gender,
    required this.profileImage
  });

  factory FeatureResidentsResponseDataModel.fromJson(Map<String, dynamic>? json) => FeatureResidentsResponseDataModel(
    id: json?["id"] ?? 0,
    residentId: json?["residentId"] ?? 0,
    firstName: json?["firstName"] ?? "",
    middleName: json?["middleName"] ?? "",
    lastName: json?["lastName"] ?? "",
    contactNumber: json?["contactNumber"] ?? 0,    
    emailAddress: json?["emailAddress"] ?? "",
    address: json?["address"] ?? "",
    birthDate: json?["birthDate"] ?? "",
    gender: json?["gender"] ?? "",
    profileImage: json?["profileImage"] ?? "",                
  );
}