import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Chat/chat_screen.dart';
import '../NotificationsScreen/notifications_screen.dart';

// Dummy LoginController class
class LoginController {
  Future<void> logoutUser() async {
    // Simulate a logout process
    await Future.delayed(const Duration(seconds: 1));
    print('User logged out');
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LoginController loginController = LoginController(); // Dummy login controller

  final List<Widget> _pages = [
    const HomeScreen(), // Avoid infinite loop by using a different widget here
    const ChatScreen(),
    const NotificationsScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final List<Map<String, dynamic>> items = [
      {
        'svg': 'Assets/Images/HomeManager/Order.svg',
        'name': 'Orders',
        'color': Colors.red,
        'route': '/OrderScreen',
      },
      {
        'svg': 'Assets/Images/HomeManager/UserManagement.svg',
        'name': 'Staff Management',
        'color': Colors.blue,
        'route': '/StaffManagementScreen',
      },
      {
        'svg': 'Assets/Images/HomeManager/Analytics.svg',
        'name': 'Analytics',
        'color': Colors.green,
        'route': '/AnalyticsScreen', // Updated route
      },
      {
        'svg': 'Assets/Images/HomeManager/Attendance.svg',
        'name': 'Attendance',
        'color': Colors.yellow,
        'route': '/AttendanceScreen',
      },
      {
        'svg': 'Assets/Images/HomeManager/Settings.svg',
        'name': 'Settings',
        'color': Colors.purple,
        'route': '/SettingScreen',
      },
    ];

    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        title: Text(
          "Dashboard Manager",
          style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        backgroundColor: theme.primaryColor,
        actions: [
          GestureDetector(
            onTap: () async {
              await loginController.logoutUser();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.red),
                  SizedBox(width: 5),
                  Text('Logout', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(item['route']); // Navigates to the correct route
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: item['color'],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            child: SvgPicture.asset(
                              item['svg'],
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            item['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
