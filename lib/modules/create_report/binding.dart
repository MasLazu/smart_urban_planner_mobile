import 'package:get/get.dart';
import 'package:smart_urban_planner/modules/create_report/controller.dart';

class CreateReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateReportController>(
      () => CreateReportController(),
    );
  }
}
