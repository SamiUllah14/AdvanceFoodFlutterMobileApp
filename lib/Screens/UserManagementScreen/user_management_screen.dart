import 'package:flutter/material.dart'; // Import statement

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'), // App bar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0), // Padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0), // Top padding

              RoundedSearchBar(), // Reusable search bar

              const SizedBox(height: 20.0), // Bottom padding

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Managers",
                      style:
                          TextStyle(fontSize: 20)), // Corrected style property
                  ElevatedButton(
                    onPressed: () {
                      // Your button press logic here
                      print('Add User button pressed');
                    },
                    child: const Text("Add Manager Data"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedSearchBar extends StatelessWidget {
  const RoundedSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
