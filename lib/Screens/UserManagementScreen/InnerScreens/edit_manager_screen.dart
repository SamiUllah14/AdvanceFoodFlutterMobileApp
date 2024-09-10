import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/Usermanagement/manager_controller.dart';
import '../../../Models/UserManagement/manager.dart';

class ManagerEditScreen extends StatelessWidget {
  final ManagerController managerController = Get.find();
  final Manager manager;

  ManagerEditScreen({required this.manager});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observable to control password visibility
  final RxBool isPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    // Initialize controllers with the manager's current data
    nameController.text = manager.name;
    roleController.text = manager.role;
    emailController.text = manager.email;
    passwordController.text = manager.password;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Manager'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: roleController,
                decoration: const InputDecoration(labelText: 'Role'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              Obx(() => TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          // Toggle the password visibility
                          isPasswordVisible.value = !isPasswordVisible.value;
                        },
                      ),
                    ),
                    obscureText: !isPasswordVisible.value, // Toggle visibility
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Create updated manager object
                  Manager updatedManager = Manager(
                    id: manager.id,
                    name: nameController.text,
                    role: roleController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  // Check if there are any changes
                  if (nameController.text == manager.name &&
                      roleController.text == manager.role &&
                      emailController.text == manager.email &&
                      passwordController.text == manager.password) {
                    // Show dialog if no changes are made
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("No Changes"),
                          content: const Text("You haven't made any changes."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }

                  // Update manager via controller
                  final success =
                      await managerController.updateManager(manager.id!, updatedManager);

                  if (success) {
                    // Show success dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Success"),
                          content: const Text("Manager updated successfully."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the success dialog
                                Get.back(); // Go back to the previous screen
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Show failure dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Error"),
                          content: const Text("Failed to update the manager. Please try again."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context), // Close the error dialog
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Center(child: Text('Update')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
