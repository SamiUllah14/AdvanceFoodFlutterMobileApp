import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/EmployeePerformance/employee_performance_controller';
import '../../Widgets/ReusableWidgets/Global/CustomCircularGraph/custom_circular_graph.dart';
import '../../Widgets/ReusableWidgets/Global/SearchBar/rounded_search_bar.dart';

class EmployeePerformanceScreen extends StatelessWidget {
  final EmployeePerformanceController controller =
      Get.find(); // Get the controller

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Performance Of Employees"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns children to the start
            children: [
              RoundedSearchBar(
                onSearchPressed: (String) {},
              ),
              const SizedBox(
                  height: 15), // Ensure there is no extra padding here
              const Text(
                "Overall Monthly",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Obx(() {
                final percentages = controller.getPercentages();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomCircularGraph(
                        data: percentages,
                        colors: const [
                          Colors.green,
                          Colors.red
                        ], // Define colors for each section
                        titles: const [
                          'Confirmed',
                          'Canceled'
                        ], // Define titles for each section
                      ),
                    ),
                    const SizedBox(width: 20), // Spacing between charts
                    Expanded(
                      child: CustomCircularGraph(
                        data: percentages,
                        colors: const [
                          Colors.green,
                          Colors.red
                        ], // Define colors for each section
                        titles: const [
                          'Confirmed',
                          'Canceled'
                        ], // Define titles for each section
                      ),
                    ),
                    const SizedBox(width: 20), // Spacing between charts

                    Expanded(
                      child: CustomCircularGraph(
                        data: percentages,
                        colors: const [
                          Colors.green,
                          Colors.red
                        ], // Define colors for each section
                        titles: const [
                          'Confirmed',
                          'Canceled'
                        ], // Define titles for each section
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
