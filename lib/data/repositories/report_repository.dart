import 'package:smart_urban_planner/core/constant.dart';
import 'package:smart_urban_planner/data/models/report.dart';
import 'package:smart_urban_planner/data/repositories/repository.dart';

class ReportRepository extends Repository {
  ReportRepository() : super('$backendUrl/reports');

  Future<List<Report>> getAll() async {
    final res = await get('');
    return List<Report>.from(res.body.map((x) => Report.fromMap(x)));
  }
}
