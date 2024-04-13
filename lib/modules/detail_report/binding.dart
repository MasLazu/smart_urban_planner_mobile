import 'package:get/get.dart';
import 'package:smart_urban_planner/modules/detail_report/controller.dart';

class DetailReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailReportController>(() => DetailReportController());
  }
}
