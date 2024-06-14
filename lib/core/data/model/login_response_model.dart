class LoginResponseModel {

  const LoginResponseModel({
    required this.message,
    required this.referenceKey,
    required this.code,
    required this.codeInfo,
    required this.errors,
    required this.token,
    required this.userName,
    required this.profileImage,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
    required this.residentId,
  });

  final String message;
  final int referenceKey;
  final int code;
  final int codeInfo;
  final int errors;
  final String token;
  final String userName;
  final String profileImage;
  final String firstName;
  final String lastName;
  final String email;
  final String id;
  final String residentId;
}