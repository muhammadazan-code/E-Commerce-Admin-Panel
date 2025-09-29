import 'package:e_commerce_web/utils/device/device_utilities.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class SidebarController extends GetxController {
  final activeItems = "".obs;
  final hoverItems = "".obs;

  void changeActiveItem(String routes) => activeItems.value = routes;

  void changeHoverItems(String route) {
    if (activeItems.value != route) hoverItems.value = route;
  }

  bool isActive(String route) => activeItems.value == route;
  bool isHovering(String route) => hoverItems.value == route;

  void menuOnTap(String route) {
    if (!isActive(route)) {
      changeActiveItem(route);

      if (TDeviceUtilities.isMobileScreen(Get.context!)) Get.back();
      Get.toNamed(route);
    }
  }
}
