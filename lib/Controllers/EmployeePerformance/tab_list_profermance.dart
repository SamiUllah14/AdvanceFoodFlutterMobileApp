import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Models/UserManagement/manager.dart';
import '../../Models/UserManagement/staff_member.dart';

class TabListPerformanceController extends GetxController {
  var TabListPerformanceEmployees = <StaffMember>[].obs; // Observable list for employees
  var TabListPerformanceManagers = <Manager>[].obs; // Observable list for managers
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // To store error messages

  @override
  void onInit() {
    super.onInit();
    fetchManagers();
    fetchStaffMembers(); // Fetch data when the controller is initialized
  }

  Future<void> fetchManagers() async {
    try {
      isLoading.value = true; // Set loading to true
      errorMessage.value = ''; // Clear previous error message
      final response = await http.get(Uri.parse("http://192.168.1.108:5274/api/managers"));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        TabListPerformanceManagers.value =
            jsonData.map((json) => Manager.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load managers');
      }
    } catch (e) {
      errorMessage.value = 'Error fetching managers: $e';
      print('Error fetching managers: $e');
    } finally {
      isLoading.value = false; // Set loading to false after the fetch is complete
    }
  }

  Future<void> fetchStaffMembers() async {
    try {
      isLoading.value = true; // Set loading to true
      errorMessage.value = ''; // Clear previous error message
      final response = await http.get(Uri.parse("http://192.168.1.108:5274/api/staffmembers"));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        TabListPerformanceEmployees.value =
            jsonData.map((json) => StaffMember.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load staff members');
      }
    } catch (e) {
      errorMessage.value = 'Error fetching staff members: $e';
      print('Error fetching staff members: $e');
    } finally {
      isLoading.value = false; // Set loading to false after the fetch is complete
    }

  }
   void refreshEmployees() {
    // Logic to refresh employee data
    fetchManagers(); // Adjust if you need separate methods for employees and managers
  }

  void refreshManagers() {
    // Logic to refresh manager data
    fetchStaffMembers(); // Adjust if you need separate methods for employees and managers
  }
}

