class RegisterDto {
  String username;
  String email;
  String password;

  RegisterDto({required this.username, required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}