import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class SearchsController extends GetxController {
  var searchResults = <dynamic>[].obs;
  var isLoading = false.obs;

  final String apiUrl = "http://192.168.1.108:5274/api/Search/owner_search_bar";

  Future<void> search(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }

    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse("$apiUrl?query=$query"));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print('Decoded JSON data: $jsonData');

        final staffMembers = jsonData['staffMembers'] ?? [];
        final managers = jsonData['managers'] ?? [];
        searchResults.value = [...staffMembers, ...managers];

        print('Updated Search Results: ${searchResults}');
      } else {
        Get.snackbar('Error', 'Failed to fetch search results');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while searching: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
