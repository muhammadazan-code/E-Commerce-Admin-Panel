import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/data/repository.authentications/authentication_repo/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class TRoutesMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthenticationRepository.instance.isAuthenticated
        ? null
        : RouteSettings(name: TRoutes.login);
  }
}
