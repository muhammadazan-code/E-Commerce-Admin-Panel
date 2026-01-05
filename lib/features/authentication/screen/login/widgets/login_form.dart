import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/features/authentication/controller/login_controller.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/constants/text_strings.dart';
import 'package:e_commerce_web/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBetweenSections,
        ),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.emailController,
              validator: TValidator.validateEmail,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TText.email,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.passwordController,
                validator: (value) =>
                    TValidator.validateEmptyText('Password', value),
                decoration: InputDecoration(
                  labelText: TText.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            /// Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) =>
                            controller.rememberMe.value = value!,
                      ),
                    ),
                    Text(TText.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(
                  onPressed: () => Get.toNamed(TRoutes.forgetPassword),
                  child: Text(TText.forgotPassword),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBetweenSections),

            /// Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text(TText.signIn),
              ),
              //   child: ElevatedButton(
              //     onPressed: () => controller.registerAdmin(
              //       email: controller.emailController.text.trim(),
              //       password: controller.passwordController.text.trim(),
              //     ),
              //     child: Center(child: Text("Register Admin")),
              //   ),
            ),
          ],
        ),
      ),
    );
  }
}
