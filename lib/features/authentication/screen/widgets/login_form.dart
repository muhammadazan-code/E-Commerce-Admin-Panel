import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBetweenSections,
        ),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TText.email,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              decoration: InputDecoration(
                labelText: TText.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.eye_slash),
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
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(TText.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(onPressed: () {}, child: Text(TText.forgotPassword)),
              ],
            ),
            SizedBox(height: TSizes.spaceBetweenSections),

            /// Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(TText.signIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
