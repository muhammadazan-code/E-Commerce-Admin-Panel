import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/utils/device/device_utilities.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class SidebarController extends GetxController {
  /// Default
  final activeItems = TRoutes.dashboard.obs;
  final hoverItems = "".obs;

  /// Wheneve we want to change the active item we call this function.
  void changeActiveItem(String routes) => activeItems.value = routes;

  ///
  void changeHoverItems(String route) {
    if (activeItems.value != route) hoverItems.value = route;
  }

  bool isActive(String route) => activeItems.value == route;
  bool isHovering(String route) => hoverItems.value == route;

  void menuOnTap(String route) {
    if (!isActive(route)) {
      ///
      changeActiveItem(route);

      ///s
      if (TDeviceUtilities.isMobileScreen(Get.context!)) Get.back();

      ///s
      Get.toNamed(route);
    }
  }
}
