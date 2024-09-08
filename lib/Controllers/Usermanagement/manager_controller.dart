import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Models/UserManagement/manager.dart';

class ManagerController extends GetxController {
  var managers = <Manager>[].obs; // Observable list for managers
  var staffMembers = <Manager>[].obs; // Observable list for staff
  var selectedManager = Rx<Manager?>(null); // Observable for the selected manager details

  @override
  void onInit() {
    super.onInit();
    fetchManagers(); // Fetch data when the controller is initialized
  }

  Future<void> fetchManagers() async {
    final response = await http.get(Uri.parse("http://192.168.1.101:5274/api/managers"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      managers.value = jsonData.map((json) => Manager.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load managers');
    }
  }

  Future<void> fetchManagerDetails(int id) async {
  final response = await http.get(Uri.parse("http://192.168.1.101:5274/api/managers/$id"));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    selectedManager.value = Manager.fromJson(jsonData);
  } else {
    throw Exception('Failed to load manager details');
  }
}


 // Add this method to delete a manager
  Future<void> deleteManager(int id) async {
    final response = await http.delete(
      Uri.parse('http://your-api-url.com/api/managers/$id'),
    );

    if (response.statusCode == 204) {
      // Remove the manager from the list
      managers.removeWhere((manager) => manager.id == id);
      Get.snackbar('Success', 'Manager deleted successfully.');
    } else {
      Get.snackbar('Error', 'Failed to delete manager.');
    }
  }

}
