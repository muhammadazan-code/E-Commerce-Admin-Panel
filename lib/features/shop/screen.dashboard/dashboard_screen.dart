import 'package:e_commerce_web/common/widgets/layouts/template/site_layout.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/responsive_screen/desktop_dashboard_screen.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/responsive_screen/mobile_dashboard_screen.dart';
import 'package:e_commerce_web/features/shop/screen.dashboard/responsive_screen/tablet_dashboard_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: DesktopDashboardScreen(),
      mobile: MobileDashboardScreen(),
      tablet: TabletDashboardScreen(),
    );
  }
}
