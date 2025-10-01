import 'package:e_commerce_web/Routes/routes.dart' show TRoutes;
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/image_strings.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? "";

    return Column(
      children: [
        /// Header
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => Get.offAllNamed(TRoutes.login),
              icon: Icon(CupertinoIcons.clear),
            ),
          ],
        ),
        SizedBox(height: TSizes.spaceBetweenItems),

        /// Images
        Image(
          fit: BoxFit.cover,
          image: AssetImage(TImagePath.deliveredEmailForResetPassword),
          width: 220,
          height: 200,
        ),
        SizedBox(height: TSizes.spaceBetweenItems),

        /// Title And Subtitle
        Text(
          TText.changeYourPasswordTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: TSizes.spaceBetweenItems),
        Text(email, style: Theme.of(context).textTheme.labelLarge),
        SizedBox(height: TSizes.spaceBetweenItems),
        Text(
          TText.changeYourPasswordSubTitle,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.apply(color: TColor.blackColor),
        ),
        SizedBox(height: TSizes.spaceBetweenSections),

        /// Buttons
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.offAllNamed(TRoutes.login),
            child: Center(child: Text(TText.tdone)),
          ),
        ),
        SizedBox(height: TSizes.spaceBetweenItems),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: Center(child: Text(TText.resendEmail)),
          ),
        ),
      ],
    );
  }
}
