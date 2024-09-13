import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_project_app/Screens/EmployeePerformanceScreen/Widgets/performance_profile_list_containers.dart';
import '../../../Controllers/EmployeePerformance/search_list_performance_controller.dart';
import 'ProfileDetailsScreenPerformance/profile_screen_detail_performance.dart';

class SearchPerformanceScreen extends StatelessWidget {
  final String searchQuery;
  final SearchListPerformanceController searchController = Get.find();

  SearchPerformanceScreen({Key? key, required this.searchQuery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('Search query: $searchQuery');
      searchController.search(searchQuery);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: Obx(() {
        if (searchController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (searchController.performanceResults.isEmpty) {
          return const Center(child: Text("No results found."));
        } else {
          return ListView.builder(
            itemCount: searchController.performanceResults.length,
            itemBuilder: (context, index) {
              final result = searchController.performanceResults[index];
              print('Result: $result'); // Debug print statement
              return GestureDetector(
                onTap: () {
                  Get.to(() => ProfileDetailsScreen(profile: result));
                },
                child: PerformanceProfileListContainers(
                  headtext: result['name'] ?? 'No name',
                  descriptionText: result['role'] ?? 'No role',
                ),
              );
            },
          );
        }
      }),
    );
  }
}
