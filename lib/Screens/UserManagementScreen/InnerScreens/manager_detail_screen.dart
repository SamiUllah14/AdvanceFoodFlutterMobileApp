import 'package:flutter/material.dart';

class ManagerDetailScreen extends StatelessWidget {
  final String managerName;
  final String managerRole;
  final String managerEmail;
  final String managerPassword;

  const ManagerDetailScreen({
    Key? key,
    required this.managerName,
    required this.managerRole,
    required this.managerEmail,
    required this.managerPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(managerName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $managerName', style: TextStyle(fontSize: 18)),
            Text('Role: $managerRole', style: TextStyle(fontSize: 18)),
            Text('Email: $managerEmail', style: TextStyle(fontSize: 18)),
            Text('Password: $managerPassword', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
