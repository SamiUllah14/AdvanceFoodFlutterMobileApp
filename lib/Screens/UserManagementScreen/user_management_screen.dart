import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Widgets/ReusableWidgets/Global/SearchBar/rounded_search_bar.dart';
import '../../Controllers/Usermanagement/manager_controller.dart';
import 'InnerScreens/AddProfileManager/add_manager_profile_screen.dart';
import 'InnerScreens/manager_detail_screen.dart';
import 'Widgets/profile_list.dart';
import 'Widgets/role_and_btn.dart';

class UserManagementScreen extends StatelessWidget {
  final ManagerController managerController = Get.put(ManagerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // This is where you reload the API or data
          await managerController.fetchManagers();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(), // Enable scrolling to refresh
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                const RoundedSearchBar(),
                const SizedBox(height: 20.0),

                // Add Manager Section
                RoleTextAndButton(
                  text: "Add",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AddManagerProfileDetailPage()),
                    );
                  },
                  text2: 'Managers',
                ),
                const SizedBox(height: 30),

                // Managers List
                Obx(() {
                  if (managerController.managers.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: managerController.managers.length,
                      itemBuilder: (context, index) {
                        final manager = managerController.managers[index];
                        return Column(
                          children: [
                            ProfileList(
                              textName: manager.name,
                              textBranchName: manager.role,
                              profileIcon: Icons.person,
                              viewIcon: () async {
                                if (manager.id != null) {
                                  await managerController
                                      .fetchManagerDetails(manager.id!);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        final selectedManager = managerController
                                            .selectedManager.value;
                                        return ManagerDetailScreen(
                                          managerName:
                                              selectedManager?.name ?? '',
                                          managerRole:
                                              selectedManager?.role ?? '',
                                          managerEmail:
                                              selectedManager?.email ?? '',
                                          managerPassword:
                                              selectedManager?.password ?? '',
                                        );
                                      },
                                    ),
                                  );
                                }
                              },
                              editIcon: () {
                                print('Edit button pressed for ${manager.name}');
                              },
                              deleteIcon: () {
                                Get.defaultDialog(
                                  title: "Delete Manager",
                                  middleText:
                                      "Are you sure you want to delete ${manager.name}?",
                                  onCancel: () => Get
                                      .back(), // Optional: Close dialog on cancel
                                  onConfirm: () async {
                                    if (manager.id != null) {
                                      // Call the delete function and wait for the result
                                      await managerController
                                          .deleteManager(manager.id!);

                                      // After deletion, close the dialog
                                      Get.back();
                                    } else {
                                      Get.snackbar(
                                          'Error', 'Manager ID is null.');
                                    }
                                  },
                                  textConfirm: "Yes",
                                  textCancel: "No",
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    );
                  }
                }),

                const SizedBox(height: 20),

                // Add Staff Members Section
                RoleTextAndButton(
                  text: "Add",
                  onPressed: () {
                    print('Add Staff button pressed');
                  },
                  text2: "Staff Members",
                ),
                const SizedBox(height: 30),

                // Staff List
                Obx(() {
                  if (managerController.staffMembers.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: managerController.staffMembers.length,
                      itemBuilder: (context, index) {
                        final staff = managerController.staffMembers[index];
                        return Column(
                          children: [
                            ProfileList(
                              textName: staff.name,
                              textBranchName: staff.role,
                              profileIcon: Icons.person,
                              viewIcon: () {},
                              editIcon: () {
                                print('Edit button pressed for ${staff.name}');
                              },
                              deleteIcon: () {
                                print('Delete button pressed for ${staff.name}');
                              },
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
