import 'package:e_commerce_web/common/widgets/layouts/template/site_layout.dart';
import 'package:e_commerce_web/features/authentication/screen/login/responsive_screen/login_desktop_tablet.dart';
import 'package:e_commerce_web/features/authentication/screen/login/responsive_screen/login_mobile.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      useLayout: false,
      desktop: LoginScreenForTabletAndDesktop(),
      mobile: LoginScreenForMobile(),
    );
  }
}
