import 'package:e_commerce_web/common/widgets/layouts/template/site_layout.dart';
import 'package:e_commerce_web/features/authentication/screen/forget_password/responsive_screens/forget_password_desktop_tablet_screen.dart';
import 'package:e_commerce_web/features/authentication/screen/forget_password/responsive_screens/forget_password_mobile_screen.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      useLayout: false,
      desktop: ForgetPasswordDesktopTabletScreen(),
      mobile: ForgetPasswordMobileScreen(),
    );
  }
}
