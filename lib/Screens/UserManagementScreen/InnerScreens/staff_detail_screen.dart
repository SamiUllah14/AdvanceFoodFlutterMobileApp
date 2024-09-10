import 'package:flutter/material.dart';

class StaffDetailScreen extends StatelessWidget {
  final String staffName;
  final String staffRole;
  final String staffEmail;
  final String staffPassword; // Add this field

  const StaffDetailScreen({
    Key? key,
    required this.staffName,
    required this.staffRole,
    required this.staffEmail,
    required this.staffPassword, // Add this parameter here as well
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff Member Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: $staffName", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Role: $staffRole", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Email: $staffEmail", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Password: $staffPassword", style: const TextStyle(fontSize: 18)), // Correctly displaying the password
          ],
        ),
      ),
    );
  }
}
