import 'package:e_commerce_web/Routes/route_middleware.dart';
import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/screen/first_screen.dart';
import 'package:e_commerce_web/screen/second_screen.dart';
import 'package:get/route_manager.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.firstScreen, page: () => FirstScreen(), middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.secondScreen, page: () => SecondScreen(),middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.secondScreenWithUID, page: () => SecondScreen()),
  ];
}
