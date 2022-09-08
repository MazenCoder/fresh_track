

class LoginParams {

  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });

  toJson() {
    return {
      "email": email,
      "password": password
    };
  }
}