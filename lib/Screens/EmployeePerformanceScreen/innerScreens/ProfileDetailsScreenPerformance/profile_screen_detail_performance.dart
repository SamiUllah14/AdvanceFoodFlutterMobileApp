import 'package:flutter/material.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> profile;

  ProfileDetailsScreen({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(profile['name'] ?? 'Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${profile['name'] ?? 'No name'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Role: ${profile['role'] ?? 'No role'}'),
            SizedBox(height: 10),
            Text('Email: ${profile['email'] ?? 'No email'}'),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}
