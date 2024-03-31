import 'package:get/get.dart';
import 'package:smart_urban_planner/modules/create_report/binding.dart';
import 'package:smart_urban_planner/modules/create_report/view.dart';
import 'package:smart_urban_planner/modules/detail_report/view.dart';
import 'package:smart_urban_planner/modules/home/binding.dart';
import 'package:smart_urban_planner/modules/home/view.dart';
import 'package:smart_urban_planner/routes/route_names.dart';

final route = [
  GetPage(
    name: RouteNames.home,
    page: () => HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: '${RouteNames.report}/:id',
    page: () => DetailReportView(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RouteNames.createReport,
    page: () => CreateReportView(),
    binding: CreateReportBinding(),
  ),
];
