import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_urban_planner/modules/create_report/binding.dart';
import 'package:smart_urban_planner/modules/create_report/view.dart';
import 'package:smart_urban_planner/modules/explore/view.dart';
import 'package:smart_urban_planner/modules/feed/view.dart';
import 'package:smart_urban_planner/modules/inbox/view.dart';
import 'package:smart_urban_planner/modules/profile/view.dart';

class HomeController extends GetxController {
  late RxInt selectedIndex;

  final List<Widget> _tabContents = [];

  HomeController() {
    _tabContents.addAll([
      ExploreView(),
      const FeedView(),
      Container(),
      InboxView(),
      ProfileView(),
    ]);
    selectedIndex = RxInt(int.parse(Get.parameters['page'] ?? '0'));
  }

  get tabContent => _tabContents[selectedIndex.value];

  void changeTab(int index) async {
    if (index == 2) {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (returnedImage == null) return;
      Get.to(() => CreateReportView(),
          binding: CreateReportBinding(image: File(returnedImage.path)));
    } else {
      selectedIndex.value = index;
    }
  }
}
