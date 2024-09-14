import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_project_app/Controllers/LoginAndRegister/login_and_register_controller.dart';
import 'package:owner_project_app/Screens/Home/home_screen.dart';
import 'package:owner_project_app/Screens/RegisterAndLoginAndLogoutScreens/Register/register_screen.dart';
import 'package:owner_project_app/Widgets/ReusableWidgets/LoginAndRegister/login_register_button.dart';
import '../../../Models/LoginAndRegister/LoginDto.dart';
import '../../../Widgets/ReusableWidgets/Global/body_text.dart';
import '../../../Widgets/ReusableWidgets/Global/header_text.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginAndRegisterController controller = Get.put(LoginAndRegisterController());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    controller.loadSavedCredentials(usernameController, passwordController); // Load saved credentials
    controller.autoLogin(); // Auto login if credentials are saved
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    const String imagePath = 'Assets/Images/LoginAndRegister/login.png';

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
                        height: screenHeight * 0.4,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.05),
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
                            const HeaderText(text: "Login"),
                            SizedBox(height: screenHeight * 0.01),
                            const BodyText(
                              text: 'Please Sign in to continue.',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const BodyText(text: "Remind me next time"),
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LoginRegisterButton(
                                  text: "Sign In",
                                  onPressed: () async {
                                    final loginDto = LoginDto(
                                      username: usernameController.text,
                                      password: passwordController.text,
                                    );
                                    
                                    bool success = await controller.loginUser(loginDto);
                                    
                                    if (success) {
                                      if (_isChecked) {
                                        controller.saveCredentials(loginDto.username, loginDto.password); // Save credentials if checkbox is checked
                                      }
                                      Get.offAll(() => const HomeScreen());
                                    } else {
                                      // Handle login failure
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
                                  "Don't have an account?",
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => RegisterScreen());
                                  },
                                  child: const Text(
                                    'Sign Up',
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
