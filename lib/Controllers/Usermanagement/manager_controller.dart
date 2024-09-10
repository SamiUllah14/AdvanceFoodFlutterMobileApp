import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Models/UserManagement/manager.dart';

class ManagerController extends GetxController {
  var managers = <Manager>[].obs; // Observable list for managers
  var staffMembers = <Manager>[].obs; // Observable list for staff
  var selectedManager = Rx<Manager?>(null); // Observable for the selected manager details
  var isLoading = false.obs; // Observable for loading state

  @override
  void onInit() {
    super.onInit();
    fetchManagers(); // Fetch data when the controller is initialized
  }

  Future<void> fetchManagers() async {
    try {
      isLoading.value = true; // Set loading to true
      final response = await http.get(Uri.parse("http://192.168.1.101:5274/api/managers"));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        managers.value = jsonData.map((json) => Manager.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load managers');
      }
    } finally {
      isLoading.value = false; // Set loading to false after the fetch is complete
    }
  }

  Future<void> fetchManagerDetails(int id) async {
    try {
      isLoading.value = true; // Set loading to true
      final response = await http.get(Uri.parse("http://192.168.1.101:5274/api/managers/$id"));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        selectedManager.value = Manager.fromJson(jsonData);
      } else {
        throw Exception('Failed to load manager details');
      }
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  Future<void> deleteManager(int id) async {
    try {
      isLoading.value = true; // Set loading to true
      final response = await http.delete(
        Uri.parse('http://192.168.1.101:5274/api/managers/$id'),
      );

      if (response.statusCode == 204) {
        // Remove the manager from the list
        managers.removeWhere((manager) => manager.id == id);
        managers.refresh(); // This refreshes the UI
        Get.snackbar('Success', 'Manager deleted successfully.');
      } else {
        Get.snackbar('Error', 'Failed to delete manager. (Status code: ${response.statusCode})');
      }
    } finally {
      isLoading.value = false; // Set loading to false after deletion
    }
  }

 Future<bool> updateManager(int id, Manager updatedManager) async {
  try {
    isLoading.value = true;
    final response = await http.put(
      Uri.parse('http://192.168.1.101:5274/api/managers/$id'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(updatedManager.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 204) { // Check for both 200 and 204
      // Update the list locally
      int index = managers.indexWhere((manager) => manager.id == id);
      if (index != -1) {
        managers[index] = updatedManager;
        managers.refresh(); // Refresh the UI
      }
      return true; // Indicate success
    } else {
      return false; // Indicate failure
    }
  } finally {
    isLoading.value = false;
  }
}

}
