import 'package:flutter/material.dart';
import 'package:owner_project_app/Screens/FinancialManagementScreen/financial_management_screen.dart';
import 'package:owner_project_app/Screens/FranchiseManagementScreen/franchise_management_screen.dart';
import 'package:owner_project_app/Screens/Home/Widgets/panel_containers.dart';
import 'package:owner_project_app/Screens/UserManagementScreen/user_management_screen.dart';
import 'package:owner_project_app/Screens/YourEmployeesScreen/your_employees_screen.dart';
import 'package:owner_project_app/Widgets/ReusableWidgets/Global/header_text.dart';

import '../EmployeePerformanceScreen/employee_performance.dart';
import '../EmployeePerformanceScreen/innerScreens/search_employee_screen.dart';
import 'Data/panel_cont_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 29, 44),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Center(
                  child: HeaderText(
                    text: "Owner Panel",
                    fontSize: screenWidth *
                        0.09, // Adjust font size based on screen width
                    color: Colors.white, // Adjust color if needed
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.8, // Define height for GridView
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YourEmployeesScreen()),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FinancialManagementScreen()),
                            );
                            break;
                             case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserManagementScreen()),
                            );
                            break; case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FranchiseManagementScreen()),
                            );
                            break; case 4:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmployeePerformanceScreen()),
                            );
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
    );
  }
}
