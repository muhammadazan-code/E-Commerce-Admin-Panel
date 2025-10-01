import 'package:e_commerce_web/utils/constants/image_strings.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(TImagePath.darkAppLogo),
            width: 100,
            height: 100,
          ),
          SizedBox(height: TSizes.spaceBetweenSections),
          Text(
            TText.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: TSizes.sm),
          Text(
            TText.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
