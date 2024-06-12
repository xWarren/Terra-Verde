class LoginEntity {
  
  LoginEntity({
    required this.message,
    required this.referenceKey,
    required this.code,
    required this.codeInfo,
    required this.errors,
    required this.token,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
    required this.residentId
  });

  String message;
  int referenceKey;
  int code;
  int codeInfo;
  int errors;
  String token;
  String userName;
  String firstName;
  String lastName;
  String email;
  String id;
  String residentId;
}
