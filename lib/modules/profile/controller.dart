import 'package:get/get.dart';
import 'package:smart_urban_planner/services/auth_service.dart';

class ProfileController extends GetxController {
  final AuthService authService = Get.find<AuthService>();

  get user => authService.user;

  Future<void> logout() async {
    await authService.logout();
  }
}
