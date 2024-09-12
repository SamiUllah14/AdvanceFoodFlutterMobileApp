import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_project_app/Widgets/ReusableWidgets/Global/side_titles_for_Screens.dart';
import '../../Controllers/EmployeePerformance/employee_performance_controller';
import '../../Widgets/ReusableWidgets/Global/CustomCircularGraph/custom_circular_graph.dart';
import '../../Widgets/ReusableWidgets/Global/SearchBar/rounded_search_bar.dart';

class EmployeePerformanceScreen extends StatefulWidget {
  @override
  _EmployeePerformanceScreenState createState() =>
      _EmployeePerformanceScreenState();
}

class _EmployeePerformanceScreenState extends State<EmployeePerformanceScreen>
    with SingleTickerProviderStateMixin {
  final EmployeePerformanceController controller = Get.find();

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController with 3 tabs
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedSearchBar(onSearchPressed: (String) {}),
              const SizedBox(height: 20),
              const SideTitlesForScreens(
                  title: "All Monthly Employee Performance"),
              Obx(() {
                final percentages = controller.getPercentages();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomCircularGraph(
                        data: percentages,
                        colors: const [Colors.green, Colors.red],
                        titles: const ['Confirmed', 'Canceled'],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomCircularGraph(
                        data: percentages,
                        colors: const [Colors.green, Colors.red],
                        titles: const ['Confirmed', 'Canceled'],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomCircularGraph(
                        data: percentages,
                        colors: const [Colors.green, Colors.red],
                        titles: const ['Confirmed', 'Canceled'],
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 10),
              const SideTitlesForScreens(title: "Managers Performance"),
              Obx(() {
                final percentages = controller.getPercentages();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomCircularGraph(
                        data: percentages,
                        colors: const [Colors.green, Colors.red],
                        titles: const ['Confirmed', 'Canceled'],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomCircularGraph(
                        data: percentages,
                        colors: const [Colors.green, Colors.red],
                        titles: const ['Confirmed', 'Canceled'],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomCircularGraph(
                        data: percentages,
                        colors: const [Colors.green, Colors.red],
                        titles: const ['Confirmed', 'Canceled'],
                      ),
                    ),
                  ],
                );
              }),

              // TabBar and TabBarView
              const SizedBox(height: 20),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                tabs: const [
                  Tab(text: 'Employees'),
                  Tab(text: 'Managers'),
                ],
              ),
              SizedBox(
                height: 300, // Adjust height as needed
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Item $index'),
                          subtitle: Text('This is item Employee $index'),
                        );
                      },
                    ),
                    ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Item $index'),
                            subtitle: Text('This is item manager $index'),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
