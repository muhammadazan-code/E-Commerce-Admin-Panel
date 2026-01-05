import 'package:e_commerce_web/common/widgets/layouts/headers/header.dart';
import 'package:e_commerce_web/common/widgets/layouts/sidebars/side_bar.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key, this.body});
  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: THeader(scaffoldKey: scaffoldKey),
      drawer: const TSidebars(),
      body: body ?? const SizedBox(),
    );
  }
}
