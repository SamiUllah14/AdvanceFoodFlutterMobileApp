import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controllers/EmployeePerformance/employee_performance_controller';
import 'Controllers/EmployeePerformance/search_list_performance_controller.dart';
import 'Controllers/EmployeePerformance/tab_list_profermance.dart';
import 'Controllers/LoginAndRegister/login_and_register_controller.dart';
import 'Controllers/Usermanagement/search_controller.dart';
import 'Screens/SplashScreen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LoginAndRegisterController());
  Get.put(SearchsController());
  Get.put(EmployeePerformanceController());
  Get.put(TabListPerformanceController());
  Get.put(SearchListPerformanceController());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      home: SplashScreen(), // Show SplashScreen initially
    );
  }
}
