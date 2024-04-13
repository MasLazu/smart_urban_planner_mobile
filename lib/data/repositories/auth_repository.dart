import 'package:get/get.dart';
import 'package:smart_urban_planner/core/constant.dart';
import 'package:smart_urban_planner/data/models/user.dart';
import 'package:smart_urban_planner/data/repositories/repository.dart';

class AuthRepository extends Repository {
  AuthRepository() : super('$backendUrl/auth');

  Future<String> login(User user) async {
    Response res = await post('/login', {
      'email': user.email,
      'password': user.password,
    });

    return res.body['token'];
  }

  Future<void> register(User user) async {
    await post('/register', {
      'name': user.name,
      'email': user.email,
      'password': user.password,
    });
  }

  Future<User> me() async {
    Response res = await get('/me');

    return User.fromJson(res.body['data']);
  }

  Future<void> logout() async {
    await post('/logout', {});
  }
}
