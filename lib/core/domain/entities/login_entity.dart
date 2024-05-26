class LoginEntity {
  
  LoginEntity({
    required this.message,
    required this.referenceKey,
    required this.code,
    required this.codeInfo,
    required this.errors,
    required this.token
  });

  String message;
  int referenceKey;
  int code;
  int codeInfo;
  int errors;
  String token;
}
