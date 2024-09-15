import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_project_app/Screens/Home/home_screen.dart';
import 'package:owner_project_app/Screens/RegisterAndLoginAndLogoutScreens/Login/login_screen.dart';
import 'package:owner_project_app/Controllers/LoginAndRegister/login_and_register_controller.dart';

import '../../Models/LoginAndRegister/LoginDto.dart';
import '../../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LoginAndRegisterController loginController = Get.find();

  @override
  void initState() {
    super.initState();
    _autoLogin();
  }

  Future<void> _autoLogin() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a loading time

    // Check if auto-login is successful
    var credentials = await loginController.localStorageService.getCredentials();
    if (credentials['username'] != null && credentials['password'] != null) {
      final loginDto = LoginDto(
        username: credentials['username']!,
        password: credentials['password']!,
      );

      bool loginSuccess = await loginController.loginUser(loginDto);
      if (loginSuccess) {
        Get.offAll(() => HomeScreen()); // Navigate to MainPage on success
      } else {
        Get.offAll(() => LoginScreen()); // Show LoginScreen if auto-login fails
      }
    } else {
      Get.offAll(() => LoginScreen()); // Navigate to LoginScreen if no credentials
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 46, 67),
      body: Center(
        child: Image.asset(
          'Assets/Images/SplashScreen/Owner_App.png',
          height: isPortrait ? screenHeight * 0.3 : screenHeight * 0.5,
          width: isPortrait ? screenWidth * 0.9 : screenWidth * 0.95,
        ),
      ),
    );
  }
}
