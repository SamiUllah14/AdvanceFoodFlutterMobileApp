import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_project_app/Controllers/LoginAndRegister/login_and_register_controller.dart';
import 'package:owner_project_app/Screens/RegisterAndLoginAndLogoutScreens/Login/login_screen.dart';
import 'package:owner_project_app/Widgets/ReusableWidgets/LoginAndRegister/login_register_button.dart';
import '../../../Models/LoginAndRegister/RegisterDto.dart';
import '../../../Widgets/ReusableWidgets/Global/body_text.dart';
import '../../../Widgets/ReusableWidgets/Global/header_text.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final LoginAndRegisterController controller = Get.put(LoginAndRegisterController());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    const String imagePath = 'Assets/Images/LoginAndRegister/register.png';

    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight * 0.3,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.05),
                          child: Center(
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HeaderText(text: "Register"),
                            SizedBox(height: screenHeight * 0.01),
                            const BodyText(
                              text: 'Please register to login.',
                              color: Colors.blue,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            TextField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person),
                                hintText: 'Username',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email),
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: const Icon(Icons.visibility),
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                         
                            SizedBox(height: screenHeight * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LoginRegisterButton(
                                  text: "Sign Up",
                                  onPressed: () async {
                                    final registerDto = RegisterDto(
                                      username: usernameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    final success = await controller.registerUser(registerDto);
                                    if (success) {
                                    Get.to(() =>  LoginScreen());
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have account? ",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => LoginScreen());
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
