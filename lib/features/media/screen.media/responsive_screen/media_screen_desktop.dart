import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/common/widgets/breadcrumbs/bread_crumbs_with_header.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DesktopMediaScreen extends StatelessWidget {
  const DesktopMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Headers
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// BreadCrumbs
                  TBreadCrumbsWithHeading(
                    heading: 'Media',
                    breadCrumbItems: [
                      TRoutes.login,
                      TRoutes.forgetPassword,
                      'Media Screen',
                    ],
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBetweenSections),

              /// Upload Arena
              /// Media
            ],
          ),
        ),
      ),
    );
  }
}
