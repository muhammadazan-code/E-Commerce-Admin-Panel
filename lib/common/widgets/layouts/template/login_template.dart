import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TLoginTemplate extends StatelessWidget {
  const TLoginTemplate({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.2),
      body: Center(
        child: SizedBox(
          width: 550,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: TSizes.appBarHeight,
                left: TSizes.defaultSpace,
                right: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                color: THelperFunctions.isDarkMode(context)
                    ? TColor.black
                    : TColor.white,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
