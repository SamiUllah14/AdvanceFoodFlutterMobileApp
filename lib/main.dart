import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_project_app/Screens/Chat/ChatEmployeeContacts/chat_employee_contact.dart';
import 'package:owner_project_app/Screens/Home/home_screen.dart';

import 'Services/appwrite_service.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures proper initialization
  AppwriteService.init(); // Initialize Appwrite client
  runApp(MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode:
          ThemeMode.system, // Automatically switch between light and dark modes
      home: MainPage(), // The main page with BottomNavigationBar
    );
  }
}

// Controller for managing the bottom navigation bar
class MainController extends GetxController {
  var selectedIndex = 0.obs; // Observed variable to track selected index

  // Define pages corresponding to the BottomNavigationBar
  final pages = [
    const HomeScreen(), // Home Screen
    Container(), // Placeholder for Notifications Screen
    const ChatEmployeeContactScreen(), // Chat Screen
  ];

  // Method to change the selected index
  void changePage(int index) {
    selectedIndex.value = index;
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainController controller =
        Get.put(MainController()); // Initialize controller

    return Scaffold(
      body: Obx(() => controller
          .pages[controller.selectedIndex.value]), // Observe the selected index
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changePage, // Change page on tap
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none),
                activeIcon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline),
                activeIcon: Icon(Icons.chat),
                label: 'Chat',
              ),
            ],
          )),
    );
  }
}
