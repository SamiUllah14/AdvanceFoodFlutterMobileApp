import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/UserManagement/manager.dart';

class ManagerService {
  final String baseUrl = 'http://192.168.1.108:5274/api/managers'; // Replace with your actual API base URL

  // Add a manager
  Future<void> addManager(Manager manager) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(manager.toJson()),
    );

    if (response.statusCode != 201) { // Check for status code 201 for successful creation
      throw Exception('Failed to add manager');
    }
  }
}
