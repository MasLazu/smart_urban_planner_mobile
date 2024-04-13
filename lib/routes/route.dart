import 'package:get/get.dart';
import 'package:smart_urban_planner/modules/detail_report/view.dart';
import 'package:smart_urban_planner/modules/home/binding.dart';
import 'package:smart_urban_planner/modules/home/view.dart';
import 'package:smart_urban_planner/modules/login/view.dart';
import 'package:smart_urban_planner/modules/register/view.dart';
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
    name: RouteNames.login,
    page: () => const LoginView(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: RouteNames.register,
    page: () => const RegisterView(),
    transition: Transition.noTransition,
  ),
];
