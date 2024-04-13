import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/data/repositories/auth_repository.dart';

class RegisterController extends GetxController {
  final authRepository = Get.find<AuthRepository>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();
}
