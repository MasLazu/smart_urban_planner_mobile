import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/data/models/user.dart';
import 'package:smart_urban_planner/helper/snackbar.dart';
import 'package:smart_urban_planner/services/auth_service.dart';

class RegisterController extends GetxController {
  final authService = Get.find<AuthService>();

  RxBool isLoading = false.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        await authService.register(User(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
        ));
      } catch (e) {
        Snackbar.error(e.toString());
      }
      isLoading.value = false;
    }
  }
}
