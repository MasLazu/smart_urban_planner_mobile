import 'dart:io';

import 'package:get/get.dart';
import 'package:smart_urban_planner/modules/create_report/controller.dart';

class CreateReportBinding extends Bindings {
  final File image;

  CreateReportBinding({required this.image});

  @override
  void dependencies() {
    Get.lazyPut(() => CreateReportController(image: image));
  }
}
