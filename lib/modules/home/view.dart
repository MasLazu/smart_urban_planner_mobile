import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_urban_planner/modules/home/controller.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _controller.tabContent),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _controller.selectedIndex.value == 0
                  ? const Icon(Iconsax.map_bold, size: 32)
                  : const Icon(Iconsax.map_1_outline, size: 32),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: _controller.selectedIndex.value == 1
                  ? const Icon(Iconsax.element_4_bold, size: 32)
                  : const Icon(Iconsax.element_4_outline, size: 32),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: _controller.selectedIndex.value == 2
                  ? const Icon(Iconsax.direct_notification_bold, size: 32)
                  : const Icon(Iconsax.direct_notification_outline, size: 32),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: _controller.selectedIndex.value == 3
                  ? const Icon(Iconsax.profile_circle_bold, size: 32)
                  : const Icon(Iconsax.profile_circle_outline, size: 32),
              label: 'Profile',
            ),
          ],
          currentIndex: _controller.selectedIndex.value,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: _controller.changeTab,
        ),
      ),
    );
  }
}
