import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/EmployeePerformance/employee_performance_controller';
import '../../Controllers/EmployeePerformance/tab_list_profermance.dart';
import '../../Widgets/ReusableWidgets/Global/CustomCircularGraph/custom_circular_graph.dart';
import '../../Widgets/ReusableWidgets/Global/SearchBar/rounded_search_bar.dart';
import 'Widgets/performance_profile_list_containers.dart';
import 'innerScreens/search_employee_screen.dart';
  
class EmployeePerformanceScreen extends StatefulWidget {
  @override
  _EmployeePerformanceScreenState createState() =>
      _EmployeePerformanceScreenState();
}

class _EmployeePerformanceScreenState extends State<EmployeePerformanceScreen>
    with SingleTickerProviderStateMixin {
  final EmployeePerformanceController employeeController =
      Get.put(EmployeePerformanceController());
  final TabListPerformanceController tabController =
      Get.put(TabListPerformanceController());

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(() {
      if (_tabController!.indexIsChanging) {
        if (_tabController!.index == 0) {
          tabController.refreshEmployees();
        } else if (_tabController!.index == 1) {
          tabController.refreshManagers();
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              RoundedSearchBar(
                onSearchPressed: (query) {
                  Get.to(() => SearchPerformanceScreen(searchQuery: query));
                },
              ),
              const SizedBox(height: 30),
              const Text("All Monthly Employee Performance"),

              Obx(() {
                final percentages = employeeController.getPercentages();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => Expanded(
                    child: CustomCircularGraph(
                      data: percentages,
                      colors: const [Colors.green, Colors.red],
                      titles: const ['Confirmed', 'Canceled'],
                    ),
                  )),
                );
              }),

              const SizedBox(height: 30),
              const Text("Managers Performance"),

              Obx(() {
                final percentages = employeeController.getPercentages();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => Expanded(
                    child: CustomCircularGraph(
                      data: percentages,
                      colors: const [Colors.green, Colors.red],
                      titles: const ['Confirmed', 'Canceled'],
                    ),
                  )),
                );
              }),

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
                height: 300,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Obx(() {
                      if (tabController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (tabController.TabListPerformanceEmployees.isEmpty) {
                        return const Center(child: Text('Failed to load employees.'));
                      } else {
                        return ListView.builder(
                          itemCount: tabController.TabListPerformanceEmployees.length,
                          itemBuilder: (context, index) {
                            final employee = tabController.TabListPerformanceEmployees[index];
                            return PerformanceProfileListContainers(
                              headtext: employee.name,
                              descriptionText: employee.role,
                            );
                          },
                        );
                      }
                    }),
                    Obx(() {
                      if (tabController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (tabController.TabListPerformanceManagers.isEmpty) {
                        return const Center(child: Text('Failed to load managers.'));
                      } else {
                        return ListView.builder(
                          itemCount: tabController.TabListPerformanceManagers.length,
                          itemBuilder: (context, index) {
                            final manager = tabController.TabListPerformanceManagers[index];
                            return PerformanceProfileListContainers(
                              headtext: manager.name,
                              descriptionText: manager.role,
                            );
                          },
                        );
                      }
                    }),
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
