class AddResidentsParam {

  AddResidentsParam({
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
    required this.relationship,
    required this.password
  });

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
  final String password;

  toJson() => {
    "residentId": residentId,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "contactNumber": contactNumber,
    "emailAddress": emailAddress,
    "address": address,
    "birthDate": birthDate,
    "gender": gender,
    "profileImage": profileImage,
    "relationship": relationship,
    "password": password
  };
}