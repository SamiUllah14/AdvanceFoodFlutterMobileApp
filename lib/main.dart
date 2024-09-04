import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:owner_project_app/Screens/Login/login_screen.dart';

import 'Screens/Register/register_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      themeMode:
          ThemeMode.system, // Automatically switch between light and dark modes

      home: RegisterScreen(),
    );
  }
}
