import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/modules/explore/view.dart';
import 'package:smart_urban_planner/modules/profile/view.dart';

class HomeController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> _tabContents = [];

  HomeController() {
    _tabContents.addAll([
      ExploreView(),
      Container(color: Colors.green),
      Container(color: Colors.blue),
      const ProfileView(),
    ]);
  }

  get tabContent => _tabContents[selectedIndex.value];

  void changeTab(int index) {
    selectedIndex.value = index;
    update();
  }
}
