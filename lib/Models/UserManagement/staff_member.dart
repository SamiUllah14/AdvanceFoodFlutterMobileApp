class StaffMember {
  final int? id; // Ensure this is non-nullable
  final String name;
  final String role; // Assuming "position" instead of "role" for staff members
  final String email;
  final String password;

  StaffMember({
    this.id,
    required this.name,
    required this.role, // Changed from 'role' to 'position'
    required this.email,
    required this.password,
  });

  factory StaffMember.fromJson(Map<String, dynamic> json) {
    return StaffMember(
      id: json['id'],
      name: json['name'],
      role: json['role'], // Changed from 'role' to 'position'
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'role': role, // Changed from 'role' to 'position'
        'email': email,
        'password': password,
      };
}
