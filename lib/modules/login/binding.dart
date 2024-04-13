import 'package:get/get.dart';
import 'package:smart_urban_planner/modules/login/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
