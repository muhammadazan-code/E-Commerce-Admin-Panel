import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/common/widgets/layouts/sidebars/controller/sidebar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/observers/route_observer.dart';
import 'package:get/instance_manager.dart';

class RouteObserver extends GetObserver {
  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());
    if (previousRoute != null) {
      for (var routeName in TRoutes.sidebarMenuItems) {
        if (previousRoute.settings.name == routeName) {
          sidebarController.activeItems.value = routeName;
        }
      }
    }
  }
}
