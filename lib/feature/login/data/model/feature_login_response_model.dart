class FeatureLoginResponseModel {

  final String message;
  final int referenceKey;
  final int code;
  final int codeInfo;
  final int errors;
  final String token;

  const FeatureLoginResponseModel({
    required this.message,
    required this.referenceKey,
    required this.code,
    required this.codeInfo,
    required this.errors,
    required this.token
  });

  factory FeatureLoginResponseModel.fromJson(Map<String, dynamic>? json) => FeatureLoginResponseModel(
    message: json?["Message"] ?? "",
    referenceKey: json?["ReferenceKey"] ?? 2,
    code: json?["Code"] ?? 0,
    codeInfo: json?["CodeInfo"] ?? 0,
    errors: json?["Errors"] ?? 0,
    token: json?["token"] ?? "",
  );
}