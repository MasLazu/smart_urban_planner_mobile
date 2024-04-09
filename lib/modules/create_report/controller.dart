import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateReportController extends GetxController {
  final File image;

  final _formKey = GlobalKey<FormState>();

  CreateReportController({required this.image});

  GlobalKey<FormState> get formKey => _formKey;

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }
}
