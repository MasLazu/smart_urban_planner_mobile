import 'package:get/get.dart';
import 'package:smart_urban_planner/core/constant.dart';
import 'package:smart_urban_planner/data/models/user.dart';
import 'package:smart_urban_planner/data/repositories/repository.dart';

class AuthRepository extends Repository {
  AuthRepository() : super('$backendUrl/auth');

  Future<String> login(User user) async {
    Response res = await post('/login', user.toMap());

    return res.body['token'];
  }

  Future<void> register(User user) async {
    await post('/register', user.toMap());
  }

  Future<User> me() async {
    Response res = await get('/me');
    return User.fromMap(res.body);
  }
}
