import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.4, // Set a height of 40% of the screen
            width: screenWidth, // Set a width of 100% of the screen
            color: Colors.blue, // Set a blue background color
            child: Center(
              child: Image.asset(
                'Assets/Images/LoginAndRegister/login.png',
                fit: BoxFit.cover, // Adjust as needed for image scaling
              ),
            ),
          ),
        ],
      ),
    );
  }
}

