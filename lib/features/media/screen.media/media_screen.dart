import 'package:e_commerce_web/common/widgets/layouts/template/site_layout.dart';
import 'package:e_commerce_web/features/media/screen.media/responsive_screen/media_screen_desktop.dart';
import 'package:e_commerce_web/features/media/screen.media/responsive_screen/media_screen_mobile.dart';
import 'package:e_commerce_web/features/media/screen.media/responsive_screen/media_screen_tablet.dart';
import 'package:flutter/material.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: DesktopMediaScreen(),
      mobile: MobileMediaScreen(),
      tablet: TabletMediaScreen(),
    );
  }
}
