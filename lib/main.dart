import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/Attendance/attendance_screen.dart';
import 'Screens/SplashScreen/splash_screen.dart';
import 'Screens/NotificationsScreen/notifications_screen.dart';
import 'Screens/Orders/order_screen.dart';
import 'Screens/SettingScreen/setting_screen.dart';
import 'Screens/Chat/chat_screen.dart';
import 'Screens/StaffManagement /staff_management_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(
            name: '/SettingScreen',
            page: () => const SettingScreen()), // StaffManagementScreen
        GetPage(
            name: '/AttendanceScreen',
            page: () =>
                const AttendanceScreen()), // Ensure this is registered correctly
        GetPage(name: '/OrderScreen', page: () => const OrderScreen()),
        GetPage(
            name: '/StaffManagementScreen',
            page: () =>  StaffManagementScreen()),

        GetPage(name: '/ChatScreen', page: () => const ChatScreen()),
        GetPage(
            name: '/NotificationsScreen',
            page: () => const NotificationsScreen()),
      ],
    );
  }
}

// below is theme

// Define light and dark themes here

final ThemeData lightTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 28, 73, 197), // Elegant Blue
  secondaryHeaderColor: const Color(0xFFFFFFFF), // White for Light Mode

  highlightColor: const Color(0xFF000000), // Black for Light Mode
  hintColor: const Color(0xFF9EB2F0), // Soft Blue
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFB3C6F7), // Light Blue
    textTheme: ButtonTextTheme.primary,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    hintStyle: TextStyle(color: Colors.grey),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Color(0xFF1E3A8A), // Elegant Blue
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 35.7,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1c2120), // Dark text for readability
    ),
    bodyLarge: TextStyle(
      fontSize: 12,
      color: Color(0xFF8f8e8e), // Light grey for body text
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xFF1E3A8A), // Elegant Blue
  secondaryHeaderColor: const Color(0xFF1c2120), // Dark Grey for Dark Mode
  highlightColor: const Color(0xFFF1F5F9), // Light Grey for Dark Mode
  hintColor: const Color(0xFF6D9AC8), // Muted Blue
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF2B4C8F), // Darker Blue
    textTheme: ButtonTextTheme.primary,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    hintStyle: TextStyle(color: Colors.grey),
  ),
  scaffoldBackgroundColor:
      const Color(0xFF121212), // Dark background for night mode
  appBarTheme: const AppBarTheme(
    color: Color(0xFF1E3A8A), // Elegant Blue
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 35.7,
      fontWeight: FontWeight.bold,
      color: Colors.white, // White text for readability in dark mode
    ),
    bodyLarge: TextStyle(
      fontSize: 12,
      color: Colors.grey, // Grey text for body text in dark mode
    ),
  ),
);
