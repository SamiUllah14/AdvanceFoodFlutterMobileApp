import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../Models/UserManagement/staff_member.dart';

class StaffMemberController extends GetxController {
  var staffMembers = <StaffMember>[].obs; // Observable list for staff members
  var selectedStaffMember = Rx<StaffMember?>(null); // Observable for the selected staff member details
  var isLoading = false.obs; // Observable for loading state

  @override
  void onInit() {
    super.onInit();
    fetchStaffMembers(); // Fetch data when the controller is initialized
  }

  Future<void> fetchStaffMembers() async {
    try {
      isLoading.value = true; // Set loading to true
      final response = await http.get(Uri.parse("http://192.168.1.108:5274/api/staffmembers"));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        staffMembers.value = jsonData.map((json) => StaffMember.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load staff members');
      }
    } finally {
      isLoading.value = false; // Set loading to false after the fetch is complete
    }
  }

  Future<void> fetchStaffMemberDetails(int id) async {
    try {
      isLoading.value = true; // Set loading to true
      final response = await http.get(Uri.parse("http://192.168.1.108:5274/api/staffmembers/$id"));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        selectedStaffMember.value = StaffMember.fromJson(jsonData);
      } else {
        throw Exception('Failed to load staff member details');
      }
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  Future<void> deleteStaffMember(int id) async {
    try {
      isLoading.value = true; // Set loading to true
      final response = await http.delete(
        Uri.parse('http://192.168.1.108:5274/api/staffmembers/$id'),
      );

      if (response.statusCode == 204) {
        // Remove the staff member from the list
        staffMembers.removeWhere((staffMember) => staffMember.id == id);
        staffMembers.refresh(); // This refreshes the UI
        Get.snackbar('Success', 'Staff member deleted successfully.');
      } else {
        Get.snackbar('Error', 'Failed to delete staff member. (Status code: ${response.statusCode})');
      }
    } finally {
      isLoading.value = false; // Set loading to false after deletion
    }
  }

  Future<bool> updateStaffMember(int id, StaffMember updatedStaffMember) async {
    try {
      isLoading.value = true;
      final response = await http.put(
        Uri.parse('http://192.168.1.108:5274/api/staffmembers/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(updatedStaffMember.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 204) { // Check for both 200 and 204
        // Update the list locally
        int index = staffMembers.indexWhere((staffMember) => staffMember.id == id);
        if (index != -1) {
          staffMembers[index] = updatedStaffMember;
          staffMembers.refresh(); // Refresh the UI
        }
        return true; // Indicate success
      } else {
        return false; // Indicate failure
      }
    } finally {
      isLoading.value = false;
    }
  }

 Future<bool> createStaffMember(StaffMember newStaffMember) async {
  try {
    isLoading.value = true;
    final response = await http.post(
      Uri.parse('http://192.168.1.108:5274/api/staffmembers'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(newStaffMember.toJson()),
    );

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) { // Check for 201 Created
      final jsonData = json.decode(response.body);
      final createdStaffMember = StaffMember.fromJson(jsonData);
      staffMembers.add(createdStaffMember);
      staffMembers.refresh();
      Get.snackbar('Success', 'Staff member created successfully.');
      return true; // Success
    } else {
      print('Failed to create staff member. Status code: ${response.statusCode}');
      Get.snackbar('Error', 'Failed to create staff member. (Status code: ${response.statusCode})');
      return false; // Failure
    }
  } catch (e) {
    print('Error occurred: $e');
    Get.snackbar('Error', 'An error occurred while creating staff member.');
    return false; // Failure
  } finally {
    isLoading.value = false;
  }
}

}
