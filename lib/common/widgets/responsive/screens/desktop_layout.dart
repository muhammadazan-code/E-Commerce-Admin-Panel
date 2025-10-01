import 'package:e_commerce_web/common/widgets/layouts/headers/header.dart';
import 'package:e_commerce_web/common/widgets/layouts/sidebars/side_bar.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({super.key, this.body});
  final Widget? body;
  final GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      key: scaffoldKey,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: TSidebars()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // Header
                THeader(),
                // Body
                body ?? SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
