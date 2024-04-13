import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/routes/route_names.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login to see your profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(RouteNames.login);
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
