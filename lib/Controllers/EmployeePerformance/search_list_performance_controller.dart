import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class SearchListPerformanceController extends GetxController {
  var performanceResults = <dynamic>[].obs;
  var isLoading = false.obs;

  final String apiUrl = "http://192.168.1.107:5274/api/Search/owner_search_bar";

  Future<void> search(String query) async {
    if (query.isEmpty) {
      performanceResults.clear();
      return;
    }

    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse("$apiUrl?query=$query"));

      print('API response status: ${response.statusCode}');
      print('API response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print('Decoded JSON data: $jsonData');

        final staffMembers = jsonData['staffMembers'] ?? [];
        final managers = jsonData['managers'] ?? [];

        // Combine both lists into one for display
        performanceResults.value = [...staffMembers, ...managers];
      } else {
        Get.snackbar('Error',
            'Failed to fetch performance results: ${response.reasonPhrase}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while searching: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
