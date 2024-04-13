import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';
import 'package:smart_urban_planner/routes/route_names.dart';
import 'package:smart_urban_planner/services/auth_service.dart';

class InboxView extends StatelessWidget {
  InboxView({super.key});

  final _authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
        backgroundColor: Styles.secondaryBackgroundColor,
      ),
      body: _authService.user == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login to see your ibox',
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
            )
          : const Column(),
    );
  }
}
