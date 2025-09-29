import 'package:e_commerce_web/common/widgets/layouts/headers/header.dart';
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
      drawer: Drawer(),
      body: body ?? const SizedBox(),
    );
  }
}
