import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';
import 'package:smart_urban_planner/modules/explore/view.dart';
import 'package:smart_urban_planner/modules/feed/view.dart';
import 'package:smart_urban_planner/modules/profile/view.dart';

class HomeController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> _tabContents = [];

  HomeController() {
    _tabContents.addAll([
      ExploreView(),
      const FeedView(),
      Container(color: Styles.backgroundColor),
      const ProfileView(),
    ]);
  }

  get tabContent => _tabContents[selectedIndex.value];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
