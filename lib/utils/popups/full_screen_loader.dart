import 'package:e_commerce_web/common/widgets/loaders/animation_loaders.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class TFullScreenLoader {
  // Open a full-screen loading dialog with a given text and animation
  // This method doesn't return anything.
  // Parameters:
  // - text: The text to be displayed in the loading dialog.
  // - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible:
          false, // The dialog can't be dismissed by tapping outside it.
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColor.dark
              : TColor.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              TAnimationLoaderWidgets(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  // Stop the currently open loading dialog
  // This method doesn't return anything
  static void stopLoading() {
    Navigator.of(Get.context!).pop(); // Close the dailog using the Navigator
  }
}
