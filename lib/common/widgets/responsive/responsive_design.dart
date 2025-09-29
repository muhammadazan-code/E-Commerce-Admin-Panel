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
        if (constraints.maxWidth >= 1300) {
          return desktop;
        } else if (constraints.maxWidth < 1300 && constraints.minWidth > 500) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
