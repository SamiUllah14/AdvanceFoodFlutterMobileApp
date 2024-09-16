import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of chip data with names and routes
    final List<Map<String, String>> chipData = [
      {'name': 'View Attendance', 'route': '/StaffManagement'},
      {'name': 'Manage Attendance', 'route': '/Page2'},
      {'name': 'Attendance Reports', 'route': '/Page3'},
      {'name': ' Settings', 'route': '/Page3'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance Screen"),
        backgroundColor: Colors.deepPurple, // AppBar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Increased padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Wrap with Chips
            Wrap(
              spacing: 12.0, // Increased horizontal space between chips
              runSpacing: 8.0, // Increased vertical space between rows of chips
              alignment: WrapAlignment.center,
              children: chipData.map((chip) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(chip['route']!); // Navigate to the route
                  },
                  child: Chip(
                    backgroundColor:
                        Colors.deepPurpleAccent, // Chip background color
                    label: Text(
                      chip['name']!,
                      style: const TextStyle(
                        color: Colors.white, // Chip text color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0), // Padding inside the chip
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    elevation: 4.0, // Shadow effect
                    shadowColor: Colors.black.withOpacity(0.2), // Shadow color
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
