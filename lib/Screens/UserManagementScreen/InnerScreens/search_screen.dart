import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/Usermanagement/search_controller.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final SearchsController searchController = Get.find(); // Get existing controller instance

  SearchScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch the search results when the screen is shown
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchController.search(searchQuery);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: Obx(() {
        // Debugging output
        print('Search Results: ${searchController.searchResults}');
        
        if (searchController.isLoading.value) {
          return const Center(child: CircularProgressIndicator()); // Show loading indicator
        } else if (searchController.searchResults.isEmpty) {
          return const Center(child: Text("No results found.")); // Show no results message
        } else {
          return ListView.builder(
            itemCount: searchController.searchResults.length,
            itemBuilder: (context, index) {
              final result = searchController.searchResults[index];
              return ListTile(
                title: Text(result['name'] ?? 'No name'), // Customize this as per your data structure
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(result['role'] ?? 'No role'),
                    Text(result['email'] ?? 'No email'),
                    Text(result['password'] ?? 'No password'),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
