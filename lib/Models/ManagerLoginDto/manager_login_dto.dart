class ManagerLoginDto {
  final String name;
  final String password;

  ManagerLoginDto({required this.name, required this.password});

  // Convert ManagerLoginDto to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
    };
  }

  // Create ManagerLoginDto from JSON
  factory ManagerLoginDto.fromJson(Map<String, dynamic> json) {
    return ManagerLoginDto(
      name: json['name'],
      password: json['password'],
    );
  }
}
