import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Models/LoginAndRegister/LoginDto.dart';
import '../../Models/LoginAndRegister/RegisterDto.dart';
import '../../Screens/Home/home_screen.dart';
import '../../Screens/RegisterAndLoginAndLogoutScreens/Login/login_screen.dart';
import '../../Services/LocalStorageServices/local_storage_service.dart';

class LoginAndRegisterController extends GetxController {
  var isLoading = false.obs; // Loading state
  var isLoggedIn = false.obs; // Track login status

  // Create an instance of LocalStorageService
  final LocalStorageService localStorageService = LocalStorageService();

  // Register user
  Future<bool> registerUser(RegisterDto registerDto) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.108:5274/api/LoginAndRegisterOwner/register'),
        body: jsonEncode(registerDto.toJson()),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        // Registration successful
        Get.snackbar('Success', 'Registration successful');
        return true;
      } else {
        Get.snackbar('Error', 'Failed to register. Please try again.');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during registration.');
      return false;
    }
  }

  // Login user
  Future<bool> loginUser(LoginDto loginDto) async {
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse('http://192.168.1.108:5274/api/LoginAndRegisterOwner/login'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(loginDto.toJson()),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final token = jsonData['token'];

        // Save token and credentials securely
        await localStorageService.saveCredentials(loginDto.username, loginDto.password);

        // Update login status
        isLoggedIn.value = true;

        // Navigate to HomeScreen after successful login
        Get.offAll(() => HomeScreen());

        Get.snackbar('Success', 'User logged in successfully');
        return true;
      } else {
        Get.snackbar('Error', 'Failed to login. (Status code: ${response.statusCode})');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while logging in.');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Save credentials
  Future<void> saveCredentials(String username, String password) async {
    await localStorageService.saveCredentials(username, password);
  }

  // Auto login if credentials are saved
  Future<void> autoLogin() async {
    var credentials = await localStorageService.getCredentials();
    if (credentials['username'] != null && credentials['password'] != null) {
      final loginDto = LoginDto(
        username: credentials['username']!,
        password: credentials['password']!,
      );

      bool success = await loginUser(loginDto);
      if (success) {
        isLoggedIn.value = true; // Update login status
        Get.offAll(() => HomeScreen());
      } else {
        isLoggedIn.value = false; // Update login status
      }
    } else {
      isLoggedIn.value = false; // No credentials, so not logged in
    }
  }

  // Load saved credentials into controllers
  Future<void> loadSavedCredentials(TextEditingController usernameController, TextEditingController passwordController) async {
    var credentials = await localStorageService.getCredentials();
    usernameController.text = credentials['username'] ?? '';
    passwordController.text = credentials['password'] ?? '';
  }

  // Logout user
  Future<void> logoutUser() async {
    await localStorageService.clearCredentials(); // Clear saved credentials
    isLoggedIn.value = false; // Update login status
    Get.offAll(() => LoginScreen()); // Navigate to LoginScreen
  }
}
