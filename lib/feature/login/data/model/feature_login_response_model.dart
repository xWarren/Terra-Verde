class FeatureLoginResponseModel {

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

  const FeatureLoginResponseModel({
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
    required this.residentId
  });

  factory FeatureLoginResponseModel.fromJson(Map<String, dynamic>? json) => FeatureLoginResponseModel(
    message: json?["Message"] ?? "",
    referenceKey: json?["ReferenceKey"] ?? 2,
    code: json?["Code"] ?? 0,
    codeInfo: json?["CodeInfo"] ?? 0,
    errors: json?["Errors"] ?? 0,
    token: json?["tokenString"] ?? "",
    userName: json?["userName"] ?? "",
    profileImage: json?["profileImage"] ?? "",
    firstName: json?["firstName"] ?? "",
    lastName: json?["lastName"] ?? "",
    email: json?["email"] ?? "",
    id: json?["id"] ?? "",
    residentId: json?["residentId"] ?? ""
  );
}