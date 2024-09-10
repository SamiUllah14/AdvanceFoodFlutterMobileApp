import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/Usermanagement/manager_controller.dart';
import '../../Controllers/Usermanagement/staff_members_controller.dart';
import '../../../Widgets/ReusableWidgets/Global/SearchBar/rounded_search_bar.dart';
import 'InnerScreens/AddProfileManager/add_manager_profile_screen.dart';
import 'InnerScreens/AddStaffmembersProfileDetailPage.dart';
import 'InnerScreens/edit_manager_screen.dart';
import 'InnerScreens/edit_staff_member_screen.dart';
import 'InnerScreens/search_screen.dart';
import 'Widgets/profile_list.dart';
import 'Widgets/role_and_btn.dart';

class UserManagementScreen extends StatelessWidget {
  final ManagerController managerController = Get.put(ManagerController());
  final StaffMemberController staffMemberController =
      Get.put(StaffMemberController());

  UserManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Reload the managers and staff members
          await managerController.fetchManagers();
          await staffMemberController.fetchStaffMembers();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                RoundedSearchBar(
                  onSearchPressed: (query) {
                    // Use Get.to to navigate and pass query via GetX
                    Get.to(() => SearchScreen(searchQuery: query,));
                  },
                ),
                const SizedBox(height: 20.0),

                // Add Manager Section
                RoleTextAndButton(
                  text: "Add",
                  onPressed: () {
                    Get.to(() => const AddManagerProfileDetailPage());
                  },
                  text2: 'Managers',
                ),
                const SizedBox(height: 30),

                // Managers List
                Obx(() {
                  if (managerController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (managerController.managers.isEmpty) {
                    return const Center(child: Text("No managers found."));
                  } else {
                    final reversedManagers =
                        managerController.managers.reversed.toList();
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reversedManagers.length,
                      itemBuilder: (context, index) {
                        final manager = reversedManagers[index];
                        return Column(
                          children: [
                            ProfileList(
                              textName: manager.name,
                              textBranchName: manager.role,
                              profileIcon: Icons.person,
                              editIcon: () {
                                Get.to(() =>
                                        ManagerEditScreen(manager: manager))!
                                    .then((_) {
                                  managerController.fetchManagers();
                                });
                              },
                              deleteIcon: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Delete Manager"),
                                      content: Text(
                                        "Are you sure you want to delete ${manager.name}?",
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              context), // Close on cancel
                                          child: const Text("No"),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            if (manager.id != null) {
                                              await managerController
                                                  .deleteManager(manager.id!);
                                              await managerController
                                                  .fetchManagers();
                                              Navigator.pop(context);
                                            } else {
                                              Get.snackbar('Error',
                                                  'Manager ID is null.');
                                            }
                                          },
                                          child: const Text("Yes"),
                                        ),
                                      ],
                                    );
                                  },
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
                    Get.to(() => const AddStaffMemberProfileDetailPage());
                  },
                  text2: "Staff Members",
                ),
                const SizedBox(height: 30),

                // Staff List
                Obx(() {
                  if (staffMemberController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (staffMemberController.staffMembers.isEmpty) {
                    return const Center(child: Text("No staff members found."));
                  } else {
                    final reversedStaffMembers =
                        staffMemberController.staffMembers.reversed.toList();
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reversedStaffMembers.length,
                      itemBuilder: (context, index) {
                        final staff = reversedStaffMembers[index];
                        return Column(
                          children: [
                            ProfileList(
                              textName: staff.name,
                              textBranchName: staff.role,
                              profileIcon: Icons.person,
                              editIcon: () {
                                Get.to(() =>
                                        EditStaffMemberScreen(staff: staff))!
                                    .then((_) {
                                  staffMemberController.fetchStaffMembers();
                                });
                              },
                              deleteIcon: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Delete Staff Member"),
                                      content: Text(
                                        "Are you sure you want to delete ${staff.name}?",
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              context), // Close on cancel
                                          child: const Text("No"),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            if (staff.id != null) {
                                              await staffMemberController
                                                  .deleteStaffMember(staff.id!);
                                              await staffMemberController
                                                  .fetchStaffMembers();
                                              Navigator.pop(context);
                                            } else {
                                              Get.snackbar('Error',
                                                  'Staff ID is null.');
                                            }
                                          },
                                          child: const Text("Yes"),
                                        ),
                                      ],
                                    );
                                  },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
