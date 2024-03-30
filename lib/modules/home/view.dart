import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';
import 'package:smart_urban_planner/modules/home/controller.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final _controller = Get.find<HomeController>();

  BottomNavigationBarItem _buildNavItem(
      int index, String title, IconData selectedIcon, IconData unselectedIcon) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: _controller.selectedIndex.value == index
            ? Icon(selectedIcon)
            : Icon(unselectedIcon),
      ),
      label: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _controller.tabContent),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _controller.selectedIndex.value,
          selectedItemColor: Styles.primaryColor,
          unselectedItemColor: Styles.mutedForegroundColor,
          showUnselectedLabels: true,
          iconSize: 29,
          backgroundColor: Styles.secondaryBackgroundColor,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          onTap: _controller.changeTab,
          items: <BottomNavigationBarItem>[
            _buildNavItem(
                0, 'Explore', Iconsax.map_bold, Iconsax.map_1_outline),
            _buildNavItem(
                1, 'Feed', Iconsax.element_4_bold, Iconsax.element_4_outline),
            _buildNavItem(2, 'Inbox', Iconsax.direct_notification_bold,
                Iconsax.direct_notification_outline),
            _buildNavItem(3, 'Profile', Iconsax.profile_circle_bold,
                Iconsax.profile_circle_outline),
          ],
        ),
      ),
    );
  }
}
