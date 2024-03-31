import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';
import 'package:smart_urban_planner/modules/create_report/controller.dart';
import 'package:camera/camera.dart';

class CreateReportView extends StatelessWidget {
  CreateReportView({super.key});

  final _controller = Get.find<CreateReportController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Preview'),
        backgroundColor: Styles.secondaryBackgroundColor,
      ),
      body: Stack(
        children: [
          Obx(() {
            if (_controller.cameraController == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return CameraPreview(_controller.cameraController);
            }
          }),
        ],
      ),
    );
  }
}
