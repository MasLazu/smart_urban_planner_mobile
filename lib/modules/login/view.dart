import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';
import 'package:smart_urban_planner/modules/login/controller.dart';
import 'package:smart_urban_planner/routes/route_names.dart';
import 'package:smart_urban_planner/widgets/form_input.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Welcome back! Please sign in to your account.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  FormInput(
                    controller: _controller.emailController,
                    hintText: 'Enter your email address',
                    isPassword: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  FormInput(
                    controller: _controller.passwordController,
                    hintText: 'Enter your password',
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 42),
                  ElevatedButton(
                    onPressed: () => _controller.submit(),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 48)),
                      backgroundColor:
                          MaterialStateProperty.all(Styles.primaryColor),
                    ),
                    child: Obx(
                      () => _controller.isLoading.value
                          ? CircularProgressIndicator(
                              color: Styles.secondaryBackgroundColor)
                          : const Text('Sign In'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed(RouteNames.register);
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Styles.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
