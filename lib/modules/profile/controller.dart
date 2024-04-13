import 'package:get/get.dart';
import 'package:smart_urban_planner/data/models/user.dart';
import 'package:smart_urban_planner/services/auth_service.dart';

class ProfileController extends GetxController {
  late AuthService authService;

  Rx<User?> user = Rx<User?>(null);

  ProfileController() {
    authService = Get.find<AuthService>();
    user.value = authService.user;
  }

  Future<void> logout() async {
    await authService.logout();
    user.value = authService.user;
  }
}
