import 'package:get/get.dart';
import 'package:smart_urban_planner/data/models/report.dart';
import 'package:smart_urban_planner/data/repositories/report_repository.dart';
import 'package:smart_urban_planner/helper/snackbar.dart';

class DetailReportController extends GetxController {
  final isLoading = true.obs;
  final Rx<Report?> report = Rx<Report?>(null);
  final _reportRepository = Get.find<ReportRepository>();

  @override
  void onInit() {
    super.onInit();
    fetchDetailReport();
  }

  void fetchDetailReport() async {
    isLoading(true);
    try {
      report.value =
          await _reportRepository.getByID(Get.parameters['id'] ?? '');
    } catch (e) {
      Snackbar.error(e.toString());
      Get.back();
    }

    isLoading(false);
  }
}
