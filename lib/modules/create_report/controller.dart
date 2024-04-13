import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_urban_planner/data/models/report.dart';
import 'package:smart_urban_planner/data/repositories/report_repository.dart';

class CreateReportController extends GetxController {
  final File image;

  final _reportRepository = Get.find<ReportRepository>();
  final isLoading = false.obs;

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();

  CreateReportController({required this.image});

  GlobalKey<FormState> get formKey => _formKey;

  Future<LatLng> _getPosition() async {
    final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return LatLng(
      currentPosition.latitude,
      currentPosition.longitude,
    );
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        final position = await _getPosition();
        _reportRepository.create(
            Report(
              title: titleController.text,
              description: descriptionController.text,
              address: addressController.text,
              latitude: position.latitude,
              longitude: position.longitude,
            ),
            image);
        Get.back();
        Get.snackbar("Success", "Report created successfully");
      } catch (e) {
        Get.snackbar('Error', e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }
}
