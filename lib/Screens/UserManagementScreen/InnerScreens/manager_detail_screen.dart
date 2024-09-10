import 'package:flutter/material.dart';

class ManagerDetailScreen extends StatelessWidget {
  final String managerName;
  final String managerRole;
  final String managerEmail;
  final String managerPassword;

  // ignore: use_super_parameters
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
            Text('Name: $managerName', style: const TextStyle(fontSize: 18)),
            Text('Role: $managerRole', style: const TextStyle(fontSize: 18)),
            Text('Email: $managerEmail', style: const TextStyle(fontSize: 18)),
            Text('Password: $managerPassword', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
