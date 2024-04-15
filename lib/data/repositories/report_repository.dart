import 'package:get/get.dart';
import 'dart:io';
import 'package:smart_urban_planner/core/constant.dart';
import 'package:smart_urban_planner/data/models/report.dart';
import 'package:smart_urban_planner/data/repositories/repository.dart';

class ReportRepository extends Repository {
  ReportRepository() : super('$backendUrl/reports');

  Future<List<Report>> getAll() async {
    final res = await get('');
    try {
      return List<Report>.from(res.body.map((x) => Report.fromMap(x)));
    } catch (e) {
      return [];
    }
  }

  Future<Report> getByID(String id) async {
    final res = await get('/$id');
    return Report.fromMap(res.body);
  }

  Future<void> create(Report report, File image) async {
    final req = report.toMap();
    req['image'] = MultipartFile(
      image.readAsBytesSync(),
      filename: image.path.split('/').last,
    );
    var formData = FormData(req);
    await post('', formData);
  }
}
