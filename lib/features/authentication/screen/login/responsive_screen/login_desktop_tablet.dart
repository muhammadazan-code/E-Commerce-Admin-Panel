import 'package:e_commerce_web/common/widgets/layouts/template/login_template.dart';
import 'package:e_commerce_web/features/authentication/screen/login/widgets/login_form.dart';
import 'package:e_commerce_web/features/authentication/screen/login/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginScreenForTabletAndDesktop extends StatelessWidget {
  const LoginScreenForTabletAndDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(
      child: Column(
        children: [
          // Header
          TLoginHeader(),
          // Login Form
          TLoginForm(),
        ],
      ),
    );
  }
}
