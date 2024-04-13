import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/core/theme/app_theme.dart';
import 'package:smart_urban_planner/data/repositories/auth_repository.dart';
import 'package:smart_urban_planner/data/repositories/report_repository.dart';
import 'package:smart_urban_planner/routes/route.dart';
import 'package:smart_urban_planner/routes/route_names.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_urban_planner/services/auth_service.dart';

void main() async {
  await GetStorage.init();
  Get.put(AuthRepository());
  Get.put(ReportRepository());
  Get.put(AuthService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Urban Planner',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme,
      getPages: route,
      initialRoute: RouteNames.home,
    );
  }
}
