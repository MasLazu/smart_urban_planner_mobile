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
import 'package:smart_urban_planner/routes/route_names.dart';
import 'package:smart_urban_planner/services/auth_service.dart';

class HomeController extends GetxController {
  late RxInt selectedIndex;
  final List<Widget> _tabContents = [];
  final _authService = Get.find<AuthService>();

  HomeController() {
    _tabContents.addAll([
      ExploreView(),
      FeedView(),
      Container(),
      InboxView(),
      ProfileView(),
    ]);
    selectedIndex = RxInt(int.parse(Get.parameters['page'] ?? '0'));
  }

  get tabContent => _tabContents[selectedIndex.value];

  void changeTab(int index) async {
    if (index == 2) {
      if (_authService.user == null) {
        Get.defaultDialog(
            title: 'Need to login',
            middleText:
                'You need to login to create a report. Do you want to login now?',
            textConfirm: 'Yes',
            textCancel: 'No',
            confirmTextColor: Colors.white,
            onCancel: () {},
            onConfirm: () {
              Get.offAllNamed(RouteNames.login);
            });
      } else {
        final returnedImage =
            await ImagePicker().pickImage(source: ImageSource.camera);
        if (returnedImage == null) return;
        Get.to(() => CreateReportView(),
                binding: CreateReportBinding(image: File(returnedImage.path)))!
            .then((v) async {
          ExploreView exploreView = _tabContents[0] as ExploreView;
          await exploreView.refetchReports();
        });
      }
    } else {
      selectedIndex.value = index;
    }
  }
}
