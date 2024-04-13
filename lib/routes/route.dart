import 'package:get/get.dart';
import 'package:smart_urban_planner/modules/detail_report/binding.dart';
import 'package:smart_urban_planner/modules/detail_report/view.dart';
import 'package:smart_urban_planner/modules/home/binding.dart';
import 'package:smart_urban_planner/modules/home/view.dart';
import 'package:smart_urban_planner/modules/login/binding.dart';
import 'package:smart_urban_planner/modules/login/view.dart';
import 'package:smart_urban_planner/modules/register/binding.dart';
import 'package:smart_urban_planner/modules/register/view.dart';
import 'package:smart_urban_planner/routes/route_names.dart';

final route = [
  GetPage(
    name: RouteNames.home,
    page: () => HomeView(),
    binding: HomeBinding(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: '${RouteNames.report}/:id',
    page: () => DetailReportView(),
    binding: DetailReportBinding(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RouteNames.login,
    page: () => LoginView(),
    binding: LoginBinding(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: RouteNames.register,
    page: () => RegisterView(),
    binding: RegisterBinding(),
    transition: Transition.noTransition,
  ),
];
