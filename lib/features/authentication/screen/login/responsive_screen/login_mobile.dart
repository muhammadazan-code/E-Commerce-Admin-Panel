import 'package:e_commerce_web/features/authentication/screen/login/widgets/login_form.dart';
import 'package:e_commerce_web/features/authentication/screen/login/widgets/login_header.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginScreenForMobile extends StatelessWidget {
  const LoginScreenForMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Login Header
              TLoginHeader(),
              // Form
              TLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
