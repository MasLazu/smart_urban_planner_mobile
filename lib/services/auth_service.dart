import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_urban_planner/core/storage_keys.dart';
import 'package:smart_urban_planner/data/models/user.dart';
import 'package:smart_urban_planner/data/repositories/auth_repository.dart';
import 'package:smart_urban_planner/helper/snackbar.dart';
import 'package:smart_urban_planner/routes/route_names.dart';

class AuthService {
  final _box = GetStorage();
  final _authRepository = Get.find<AuthRepository>();

  AuthService() {
    authCheck();
  }

  Future<void> authCheck() async {
    final userJson = _box.read(StorageKeys.user);
    if (userJson != null) {
      try {
        await _authRepository.me();
      } catch (e) {
        _box.remove(StorageKeys.token);
        _box.remove(StorageKeys.user);
      }
    }
  }

  User? get user {
    final userJson = _box.read(StorageKeys.user);
    return userJson != null ? User.fromJson(userJson) : null;
  }

  String? get token => _box.read(StorageKeys.token);

  set _user(User? user) {
    _box.write(StorageKeys.user, user?.toJson());
  }

  Future<void> login(User user) async {
    final token = await _authRepository.login(user);
    _box.write(StorageKeys.token, token);
    _user = await _authRepository.me();
    Get.offAllNamed(RouteNames.home);
    Snackbar.success("You are logged in!");
  }

  Future<void> register(User user) async {
    await _authRepository.register(user);
    login(user);
  }

  Future<void> logout() async {
    _box.remove(StorageKeys.token);
    _box.remove(StorageKeys.user);
    Get.offAllNamed('${RouteNames.home}?page=4');
  }
}
