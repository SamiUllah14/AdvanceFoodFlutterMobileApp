import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Models/UserManagement/staff_member.dart';
import 'package:owner_project_app/Widgets/ReusableWidgets/Global/ReusableTextField/reusable_textfield.dart';

import '../../../Controllers/Usermanagement/staff_members_controller.dart';

class AddStaffMemberProfileDetailPage extends StatefulWidget {
  const AddStaffMemberProfileDetailPage({super.key});

  @override
  State<AddStaffMemberProfileDetailPage> createState() =>
      _AddStaffMemberProfileDetailPageState();
}

class _AddStaffMemberProfileDetailPageState
    extends State<AddStaffMemberProfileDetailPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Get an instance of the StaffMemberController
  final StaffMemberController staffMemberController = Get.put(StaffMemberController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Staff Member Profile"),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (staffMemberController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
        
          return SingleChildScrollView(
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
                      labelText: "Email",
                      hintText: "Enter email",
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
                      hintText: "Enter password",
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
                            final staffMember = StaffMember(
                              name: nameController.text,
                              role: roleController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              id: null,
                            );
        
                            try {
                              bool success = await staffMemberController.createStaffMember(staffMember);
                              if (success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Staff member added successfully')),
                                );
                                // Clear fields after successful submission
                                nameController.clear();
                                roleController.clear();
                                emailController.clear();
                                passwordController.clear();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Failed to add staff member')),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Failed to add staff member')),
                              );
                            }
                          }
                        },
                        child: const Text("Add Staff Member"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
