import 'package:e_commerce_web/common/widgets/layouts/template/login_template.dart';
import 'package:e_commerce_web/features/authentication/screen/reset_password/widgets/reset_password_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordDesktopTabletScreen extends StatelessWidget {
  const ResetPasswordDesktopTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(child: ResetPasswordWidget());
  }
}
