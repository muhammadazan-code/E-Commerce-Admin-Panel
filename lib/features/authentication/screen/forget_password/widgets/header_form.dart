import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/constants/text_strings.dart' show TText;
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

class HeaderAndForm extends StatelessWidget {
  const HeaderAndForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        IconButton(onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left)),
        SizedBox(height: TSizes.spaceBetweenItems),
        Text(
          TText.forgotPassword,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: TSizes.spaceBetweenItems),
        Text(
          TText.forgotPasswordSubtitle,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.apply(color: TColor.blackColor),
        ),
        SizedBox(height: TSizes.spaceBetweenSections * 2),

        /// Form
        Form(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: TText.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
        ),
        SizedBox(height: TSizes.spaceBetweenItems),

        /// Submit Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(
              TRoutes.resetPassword,
              parameters: {'email': 'some@gmail.com'},
            ),
            child: Center(child: Text(TText.submit)),
          ),
        ),
      ],
    );
  }
}
