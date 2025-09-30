import 'package:e_commerce_web/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class TRoutesMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print('================ Middleware ==============================');
    final isAuthenticated = true;
    return isAuthenticated ? null : RouteSettings(name: TRoutes.firstScreen);
  }
}
