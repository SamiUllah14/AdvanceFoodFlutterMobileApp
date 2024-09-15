import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_project_app/Screens/FinancialManagementScreen/financial_management_screen.dart';
import 'package:owner_project_app/Screens/FranchiseManagementScreen/franchise_management_screen.dart';
import 'package:owner_project_app/Screens/UserManagementScreen/user_management_screen.dart';
import 'package:owner_project_app/Screens/EmployeePerformanceScreen/employee_performance.dart';
import 'package:owner_project_app/Screens/Home/Widgets/panel_containers.dart';
import 'package:owner_project_app/Screens/Home/Data/panel_cont_data.dart';
import '../../Controllers/LoginAndRegister/login_and_register_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LoginAndRegisterController loginController = Get.find();
  final PageController _pageController = PageController();
  int _selectedIndex = 0; // Track the selected index

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.teal,
    Colors.amber,
    Colors.indigo,
    Colors.lime,
    Colors.pink,
    Colors.brown,
    Colors.grey,
    Colors.deepOrange,
    Colors.deepPurple,
  ];

  @override
  void initState() {
    super.initState();
    // Add listener to PageController
    _pageController.addListener(() {
      final pageIndex = _pageController.page?.round() ?? 0;
      if (pageIndex != _selectedIndex) {
        setState(() {
          _selectedIndex = pageIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 29, 44),
      appBar: AppBar(
        title: const Text("Owner Panel"),
        actions: [
          GestureDetector(
            onTap: () async {
              await loginController.logoutUser();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: const [
                  Icon(Icons.logout, color: Colors.red),
                  SizedBox(width: 5),
                  Text('Logout', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.8, // Define height for GridView
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid
                        crossAxisSpacing: 10.0, // Spacing between columns
                        mainAxisSpacing: 10.0, // Spacing between rows
                      ),
                      itemCount: panelData.length, // Number of items
                      itemBuilder: (context, index) {
                        final data = panelData[index];
                        return PanelContainer(
                          imagePath: data['imagePath']!,
                          text: data['text']!,
                          onTap: () {
                            switch (index) {
                              case 0:
                                Get.to(() => const FinancialManagementScreen());
                                break;
                              case 1:
                                Get.to(() => UserManagementScreen());
                                break;
                              case 2:
                                Get.to(() => const FranchiseManagementScreen());
                                break;
                              case 3:
                                Get.to(() => EmployeePerformanceScreen());
                                break;
                              // Add more cases for other panels
                            }
                          },
                          color: colors[
                              index % colors.length], // Assign a unique color
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add more pages here if needed
          Container(
            color: Colors.blueGrey,
            child: const Center(child: Text("Page 2")),
          ),
          Container(
            color: Colors.blue,
            child: const Center(child: Text("Page 3")),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Set the current index
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
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
      ),
    );
  }
}
