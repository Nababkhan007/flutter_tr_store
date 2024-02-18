import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/constants.dart';

class AppUtil {
  static SnackbarController showSnackBar(String title, String message,
          {Color colorText = AppColors.black,
          Color backgroundColor = Colors.transparent,
          Color leftBarIndicatorColor = AppColors.success}) =>
      Get.snackbar(title, message,
          margin: const EdgeInsets.all(20.0),
          snackPosition: SnackPosition.BOTTOM,
          forwardAnimationCurve: Curves.easeOutBack,
          colorText: colorText,
          backgroundColor: backgroundColor,
          leftBarIndicatorColor: leftBarIndicatorColor);
}
