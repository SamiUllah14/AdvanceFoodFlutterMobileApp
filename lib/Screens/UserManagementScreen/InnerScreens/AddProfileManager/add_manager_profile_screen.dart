import 'package:flutter/material.dart';
import 'package:owner_project_app/Widgets/ReusableWidgets/Global/ReusableTextField/reusable_textfield.dart';
import '../../../../Models/UserManagement/manager.dart';
import '../../../../Services/UserManagement/manager_services.dart';

class AddManagerProfileDetailPage extends StatefulWidget {
  const AddManagerProfileDetailPage({super.key});

  @override
  State<AddManagerProfileDetailPage> createState() =>
      _AddManagerProfileDetailPageState();
}

class _AddManagerProfileDetailPageState
    extends State<AddManagerProfileDetailPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ManagerService _managerService = ManagerService();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Manager Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Add functionality to pick an image or edit profile picture
                  },
                  child: Container(
                    height: isPortrait ? screenHeight * 0.12 : screenHeight * 0.2,
                    width: isPortrait ? screenWidth * 0.9 : screenWidth * 0.95,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue, // Placeholder for profile picture background color
                    ),
                    child: const Icon(
                      Icons.person, // Placeholder for profile icon
                      size: 40,
                      color: Colors.white, // Icon color
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                const SizedBox(height: 10),
                ReusableTextField(
                  labelText: "Name",
                  hintText: "Enter full name",
                  controller: nameController,
                  icon: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),

                ReusableTextField(
                  labelText: "Role in Your Company",
                  hintText: "Enter role",
                  controller: roleController,
                  icon: Icons.home,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your role';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),

                ReusableTextField(
                  labelText: "Manager Email",
                  hintText: "Enter manager email",
                  controller: emailController,
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),

                ReusableTextField(
                  labelText: "Password",
                  hintText: "Enter password for manager",
                  controller: passwordController,
                  icon: Icons.visibility,
                  isObscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    if (!RegExp(r'(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
                      return 'Enter uppercase letter and one number';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Add Button
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        final manager = Manager(
                          name: nameController.text,
                          role: roleController.text,
                          email: emailController.text,
                          password: passwordController.text, id: null,
                        );

                        try {
                          await _managerService.addManager(manager);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Manager added successfully')),
                          );
                          // Clear fields after successful submission
                          nameController.clear();
                          roleController.clear();
                          emailController.clear();
                          passwordController.clear();
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Failed to add manager')),
                          );
                        }
                      }
                    },
                    child: const Text("Add Manager"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
