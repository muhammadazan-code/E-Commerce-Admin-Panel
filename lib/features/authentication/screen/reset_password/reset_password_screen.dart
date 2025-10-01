import 'package:e_commerce_web/common/widgets/layouts/template/site_layout.dart';
import 'package:e_commerce_web/features/authentication/screen/reset_password/responsive_screens/reset_password_desktop_tablet.dart';
import 'package:e_commerce_web/features/authentication/screen/reset_password/responsive_screens/reset_password_mobile.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      useLayout: false,
      desktop: ResetPasswordDesktopTabletScreen(),
      mobile: ResetPasswordMobileScreen(),
    );
  }
}
