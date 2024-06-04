class FeatureResidentsDataEntity {

  FeatureResidentsDataEntity({
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
    required this.profileImage,
    required this.relationship
  });

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
  final String relationship;
}