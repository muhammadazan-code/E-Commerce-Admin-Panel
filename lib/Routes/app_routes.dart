import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/features/authentication/screen/login_screen.dart';
import 'package:get/route_manager.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: () => LoginScreen()),
  ];
}
