import 'package:smart_urban_planner/core/constant.dart';
import 'package:smart_urban_planner/data/repositories/repository.dart';

class ReportRepository extends Repository {
  ReportRepository() : super('$backendUrl/reports');
}
