import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/LoginAndRegister/login_and_register_controller.dart';
import '../../Models/LoginAndRegister/LoginDto.dart';
import '../Home/home_screen.dart';
import '../RegisterAndLoginAndLogoutScreens/Login/login_screen.dart';

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
        Get.offAll(() => HomeScreen()); // Navigate to HomeScreen on success
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
