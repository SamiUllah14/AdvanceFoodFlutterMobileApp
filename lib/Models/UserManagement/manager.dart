class Manager {
  final int? id; // Ensure this is non-nullable
  final String name;
  final String role;
  final String email;
  final String password;

  Manager({
      this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.password,
  });

  factory Manager.fromJson(Map<String, dynamic> json) {
    return Manager(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'role': role,
        'email': email,
        'password': password,
      };
}
