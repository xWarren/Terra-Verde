class LoginParam {

  LoginParam({
    required this.email,
    required this.password
  });

  final String email;
  final String password;

  toJson() => {
    "userName": email,
    "password": password
  };
}