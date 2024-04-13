import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/modules/profile/controller.dart';
import 'package:smart_urban_planner/routes/route_names.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final _controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: _controller.user.value == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login to see your profile',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(RouteNames.login);
                      },
                      child: const Text('Login'),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Profile',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text('Name: ${_controller.user.value!.name}'),
                    Text('Email: ${_controller.user.value!.email}'),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        _controller.logout();
                      },
                      child: const Text('Logout'),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
