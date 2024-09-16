import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../HomeScreen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to HomeScreen after a delay
    Future.delayed(const Duration(seconds: 4), () {
      Get.off(() => const HomeScreen());
    });

    // Splash screen content
    return const Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
