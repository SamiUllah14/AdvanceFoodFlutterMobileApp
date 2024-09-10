import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/Usermanagement/staff_members_controller.dart';
import '../../../Models/UserManagement/staff_member.dart';

class EditStaffMemberScreen extends StatelessWidget {
  final StaffMember staff;
  final StaffMemberController staffMemberController = Get.find();

  EditStaffMemberScreen({Key? key, required this.staff}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // Observable to control password visibility
  final RxBool isPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    nameController.text = staff.name;
    roleController.text = staff.role;
    emailController.text = staff.email;
    passController.text = staff.password ?? ''; // Initialize password controller

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Staff Member'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: roleController,
              decoration: const InputDecoration(labelText: "Role"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            Obx(() => TextField(
                  controller: passController,
                  obscureText: !isPasswordVisible.value, // Toggle visibility
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        // Toggle password visibility
                        isPasswordVisible.value = !isPasswordVisible.value;
                      },
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final updatedStaff = StaffMember(
                  id: staff.id,
                  name: nameController.text,
                  role: roleController.text,
                  email: emailController.text,
                  password: passController.text, // Pass the updated password
                );

                bool success = await staffMemberController.updateStaffMember(
                    staff.id!, updatedStaff);

                if (success) {
                  Get.snackbar('Success', 'Staff member updated successfully.');
                  Navigator.pop(context); // Go back after successful update
                } else {
                  Get.snackbar('Error', 'Failed to update staff member.');
                }
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
