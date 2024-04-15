import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smart_urban_planner/core/theme/styles.dart';

class Snackbar {
  static void info(String message) {
    Get.snackbar(
      "Info",
      message,
      colorText: Styles.foregroundColor,
      backgroundColor: Styles.secondaryBackgroundColor,
      icon: Icon(Iconsax.notification_1_bold, color: Styles.primaryColor),
    );
  }

  static void success(String message) {
    Get.snackbar(
      "Success",
      message,
      colorText: Styles.secondaryBackgroundColor,
      backgroundColor: Styles.successColor,
      icon: Icon(Iconsax.tick_circle_bold,
          color: Styles.secondaryBackgroundColor),
    );
  }

  static void warning(String message) {
    Get.snackbar(
      "Warning",
      message,
      colorText: Styles.foregroundColor,
      backgroundColor: Styles.warningColor,
      icon: Icon(Iconsax.warning_2_bold, color: Styles.foregroundColor),
    );
  }

  static void error(String message) {
    Get.snackbar(
      "Error",
      message.replaceFirst('Exception: ', ''),
      colorText: Styles.secondaryBackgroundColor,
      backgroundColor: Styles.errorColor,
      icon: Icon(Iconsax.close_circle_bold,
          color: Styles.secondaryBackgroundColor),
    );
  }
}
