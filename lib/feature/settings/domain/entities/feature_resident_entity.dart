class FeatureResidentEntity {

  FeatureResidentEntity({
    required this.id,
    required this.email,
    required this.residentId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.profileImage
  });

  final int id;
  final String email;
  final String residentId;
  final String firstName;
  final String lastName;
  final String address;
  final String profileImage;
}