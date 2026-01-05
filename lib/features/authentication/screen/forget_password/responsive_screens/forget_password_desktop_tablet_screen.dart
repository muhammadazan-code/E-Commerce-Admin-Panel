import 'package:e_commerce_web/common/widgets/layouts/template/login_template.dart';
import 'package:e_commerce_web/features/authentication/screen/forget_password/widgets/header_form.dart';
import 'package:flutter/material.dart';

class ForgetPasswordDesktopTabletScreen extends StatelessWidget {
  const ForgetPasswordDesktopTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(child: HeaderAndForm());
  }
}
