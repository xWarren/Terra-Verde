class LoginResponseModel {

  const LoginResponseModel({
    required this.message,
    required this.referenceKey,
    required this.code,
    required this.codeInfo,
    required this.errors,
    required this.token,
    required this.userName
  });

  final String message;
  final int referenceKey;
  final int code;
  final int codeInfo;
  final int errors;
  final String token;
  final String userName;
}