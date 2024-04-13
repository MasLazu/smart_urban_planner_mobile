import 'package:get/get.dart';
import 'package:smart_urban_planner/modules/explore/controller.dart';
import 'package:smart_urban_planner/modules/feed/controller.dart';
import 'package:smart_urban_planner/modules/home/controller.dart';
import 'package:smart_urban_planner/modules/profile/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ExploreController>(() => ExploreController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<FeedController>(() => FeedController());
  }
}
