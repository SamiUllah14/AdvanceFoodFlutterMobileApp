import 'package:flutter/material.dart';

class StaffDetailScreen extends StatelessWidget {
  final String staffName;

  StaffDetailScreen({required this.staffName, required String staffRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff Detail'),
      ),
      body: Center(
        child: Text('Details for $staffName'),
      ),
    );
  }
}
