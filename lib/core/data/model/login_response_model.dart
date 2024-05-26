class LoginResponseModel {

  const LoginResponseModel({
    required this.message,
    required this.referenceKey,
    required this.code,
    required this.codeInfo,
    required this.errors,
    required this.token
  });

  final String message;
  final int referenceKey;
  final int code;
  final int codeInfo;
  final int errors;
  final String token;
}