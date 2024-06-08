class FeatureLoginEntity {

  FeatureLoginEntity({
    required this.message,
    required this.referenceKey,
    required this.code,
    required this.codeInfo,
    required this.errors,
    required this.token,
    required this.userName
  });

  String message;
  int referenceKey;
  int code;
  int codeInfo;
  int errors;
  String token;
  String userName;
}