import 'package:flutter/material.dart';
import '../../Widgets/ReusableWidgets/Global/ProfileListContainer/profile_list.dart';
import '../../Widgets/ReusableWidgets/Global/SearchBar/rounded_search_bar.dart';
import '../../Widgets/ReusableWidgets/Global/side_titles_for_Screens.dart';

class StaffManagementScreen extends StatelessWidget {
  StaffManagementScreen({super.key});

  // Dummy controller for search bar
  final TextEditingController searchController = TextEditingController();

  // List of sample staff names and roles
  final List<Map<String, String>> staffList = List.generate(
    10,
    (index) => {
      'name': 'Staff Member ${index + 1}',
      'role': index % 2 == 0 ? 'Role A' : 'Role B', // Alternating roles
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Staff Management"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Search Bar Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedSearchBar(
                  searchController: searchController,
                  hintText: "Search staff...",
                  onSearchIconTap: () {
                    // Custom action on search icon tap
                    print(
                        "Search icon clicked! Current text: ${searchController.text}");
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Side title
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SideTitlesForScreens(
                  title: 'Staff Members',
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Profile List (Using ListView.builder to generate multiple items)
            Expanded(
              child: ListView.builder(
                itemCount: staffList.length, // Number of staff members
                itemBuilder: (context, index) {
                  final staff = staffList[index];
                  return ProfileList(
                    textName: staff['name']!,
                    textBranchName: staff['role']!,
                    profileIcon: Icons.person, // Using Icon widget
                    deleteIcon: () {
                      // Placeholder for delete icon action
                      print('Delete icon clicked for ${staff['name']}');
                    },
                    editIcon: () {
                      // Placeholder for edit icon action
                      print('Edit icon clicked for ${staff['name']}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
