import 'package:e_commerce_web/common/widgets/responsive/responsive_design.dart';
import 'package:e_commerce_web/common/widgets/responsive/screens/desktop_layout.dart';
import 'package:e_commerce_web/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:e_commerce_web/common/widgets/responsive/screens/tablet_layout.dart';
import 'package:flutter/material.dart';

/// Template for the overall site layout, responsive to different screen size
class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({
    super.key,
    this.desktop,
    this.tablet,
    this.mobile,
    this.useLayout = true,
  });
  final Widget? desktop;
  final Widget? tablet;
  final bool useLayout;
  final Widget? mobile;
  @override
  Widget build(BuildContext context) {
    return TResponsiveDesign(
      desktop: useLayout
          ? DesktopLayout(body: desktop)
          : desktop ?? Container(),
      tablet: useLayout
          ? TabletLayout(body: tablet ?? desktop)
          : tablet ?? desktop ?? Container(),
      mobile: useLayout
          ? MobileLayout(body: mobile ?? desktop)
          : mobile ?? desktop ?? Container(),
    );
  }
}
