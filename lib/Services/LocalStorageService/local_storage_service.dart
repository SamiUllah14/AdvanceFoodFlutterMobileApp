import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  // Save the manager's credentials (name and password)
  Future<void> saveCredentials(String name, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name); // Save the manager's name
    await prefs.setString('password', password); // Save the password
  }

  // Retrieve the saved credentials (name and password)
  Future<Map<String, String?>> getCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name'); // Get the saved manager's name
    String? password = prefs.getString('password'); // Get the saved password
    return {'name': name, 'password': password}; // Return the credentials as a map
  }

  // Clear the saved credentials (name and password)
  Future<void> clearCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name'); // Remove the saved manager's name
    await prefs.remove('password'); // Remove the saved password
  }
}
