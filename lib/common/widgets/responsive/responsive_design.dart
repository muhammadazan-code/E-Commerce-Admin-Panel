import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TResponsiveDesign extends StatelessWidget {
  const TResponsiveDesign({
    super.key,
    required this.desktop,
    required this.mobile,
    required this.tablet,
  });
  final Widget desktop;
  final Widget mobile;
  final Widget tablet;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= TSizes.desktopScreenSize) {
          return desktop;
        } else if (constraints.maxWidth < TSizes.desktopScreenSize &&
            constraints.minWidth >= TSizes.tabletScreenSize) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
