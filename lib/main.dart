import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/core/theme/app_theme.dart';
import 'package:smart_urban_planner/routes/route.dart';
import 'package:smart_urban_planner/routes/route_names.dart';

void main() {
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
