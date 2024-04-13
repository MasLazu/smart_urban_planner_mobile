import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/routes/route_names.dart';
import 'package:smart_urban_planner/services/auth_service.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final _authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _authService.user == null
            ? Column(
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
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text('Name: ${_authService.user!.name}'),
                  Text('Email: ${_authService.user!.email}'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      _authService.logout();
                    },
                    child: const Text('Logout'),
                  )
                ],
              ),
      ),
    );
  }
}
