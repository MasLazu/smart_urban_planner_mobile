import 'package:get/get.dart';
import 'package:smart_urban_planner/modules/register/controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
