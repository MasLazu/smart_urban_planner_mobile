import 'package:get/get.dart';
import 'package:smart_urban_planner/data/models/report.dart';
import 'package:smart_urban_planner/data/repositories/report_repository.dart';
import 'package:smart_urban_planner/helper/snackbar.dart';

class FeedController extends GetxController {
  final _reportRepository = Get.find<ReportRepository>();

  final reports = <Report>[].obs;
  final isLoading = true.obs;

  Future<void> refetchReports() async {
    reports.clear();
    await fetchReports();
  }

  Future<void> fetchReports() async {
    isLoading(true);
    try {
      final res = await _reportRepository.getAll();
      reports.assignAll(res);
      isLoading(false);
    } catch (e) {
      Snackbar.error(e.toString());
    }
  }

  @override
  void onInit() {
    fetchReports();
    super.onInit();
  }
}
