import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:owner_project_app/Screens/Login/login_screen.dart';
import 'package:owner_project_app/Widgets/ReusableWidgets/LoginAndRegister/login_register_button.dart';

import '../../Widgets/ReusableWidgets/Global/body_text.dart';
import '../../Widgets/ReusableWidgets/Global/header_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Replace 'Assets/Images/LoginAndRegister/login.png' with the actual path to your image
    const String imagePath = 'Assets/Images/LoginAndRegister/register.png';

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, // 4% of the screen width
          ),
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.3, // 40% of the screen height
                width: double.infinity, // Full width of the screen
                child: Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.05 // 5% of the screen height
                      ),
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
                    ReusableText(text: "Register"),
                    SizedBox(
                        height: screenHeight * 0.01), // 2% of the screen height
                    BodyText(
                      text: 'Please register to login.',
                      color: Colors.blue,
                    ),

                    SizedBox(
                        height: screenHeight * 0.02), // 3% of the screen height
                    TextField(
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
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: 'Mobile Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: screenHeight * 0.02), // 3% of the screen height
                    TextField(
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

                    SizedBox(
                        height: screenHeight * 0.02), // 2% of the screen height
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodyText(text: "Remind me next time"),
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
                    SizedBox(
                        height: screenHeight * 0.01), // 3% of the screen height
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginRegisterButton(
                          text: "Sign Up",
                          onPressed: () {
                            // Handle sign-in logic
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                        height: screenHeight * 0.02), // 2% of the screen height
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
                            Get.to(const LoginScreen());
                            // Handle sign up logic here
                            print('Sign Up button pressed!');
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
    );
  }
}
