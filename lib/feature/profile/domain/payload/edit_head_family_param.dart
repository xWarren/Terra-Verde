class EditHeadFamilyParam {

  EditHeadFamilyParam({
    required this.id,
    required this.residentId,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.address,
    required this.profileImage,
    required this.password
  });

  final int id;
  final int residentId;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String address;
  final String profileImage;
  final String password;

  toJson() => {
    "Id": id,
    "ResidentCode": residentId,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": emailAddress,
    "Address": address,
    "File": profileImage,
    "Password": password
  };
}