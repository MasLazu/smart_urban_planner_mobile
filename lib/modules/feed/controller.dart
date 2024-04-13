import 'package:get/get.dart';
import 'package:smart_urban_planner/data/models/report.dart';
import 'package:smart_urban_planner/data/repositories/report_repository.dart';

class FeedController extends GetxController {
  final reportRepository = Get.find<ReportRepository>();

  final reports = <Report>[].obs;
  final isLoading = true.obs;

  void fetchReports() async {
    isLoading(true);
    final res = await reportRepository.getAll();
    reports.assignAll(res);
    isLoading(false);
  }

  @override
  void onInit() {
    fetchReports();
    super.onInit();
  }
}
