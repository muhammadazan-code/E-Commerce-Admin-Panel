import 'package:e_commerce_web/Routes/route_middleware.dart';
import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/features/authentication/screen/forget_password/forget_password_screen.dart';
import 'package:e_commerce_web/features/authentication/screen/login/login_screen.dart';
import 'package:e_commerce_web/features/authentication/screen/reset_password/reset_password_screen.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/dashboard_screen.dart';
import 'package:get/route_manager.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: () => LoginScreen()),
    GetPage(name: TRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(
      name: TRoutes.dashboard,
      page: () => DashboardScreen(),
      middlewares: [TRoutesMiddleware()],
    ),
  ];
}
