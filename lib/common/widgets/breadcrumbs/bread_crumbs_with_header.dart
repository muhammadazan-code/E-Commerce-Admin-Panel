import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/common/widgets/page_heading/t_page_heading.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TBreadCrumbsWithHeading extends StatelessWidget {
  const TBreadCrumbsWithHeading({
    super.key,
    required this.heading,
    required this.breadCrumbItems,
    this.returnToPreviousScreen = false,
  });
  final String heading;
  final List<String> breadCrumbItems;
  final bool returnToPreviousScreen;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      var a = "/abcd";
      // print(a.capitalize.toString());
      print(capitalize(a.substring(1).toString()));
      var i = breadCrumbItems[0].capitalize.toString();
      print("I = ${i.capitalize.toString()}");
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// BreadCrumb trails
        Row(
          children: [
            /// Dashboard Tiles
            InkWell(
              onTap: () => Get.offAllNamed(TRoutes.dashboard),
              child: Padding(
                padding: const EdgeInsets.all(TSizes.xs),
                child: Text(
                  "Dashboard",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.apply(fontWeightDelta: -1),
                ),
              ),
            ),
            for (int i = 0; i < breadCrumbItems.length; i++)
              Row(
                children: [
                  Text("/"),
                  InkWell(
                    onTap: i == breadCrumbItems.length - 1
                        ? null
                        : () => Get.toNamed(breadCrumbItems[i]),
                    child: Padding(
                      padding: const EdgeInsets.all(TSizes.xs),

                      /// Format breadcrumb items: capitalize and remove leading '/'
                      child: Text(
                        i == breadCrumbItems.length - 1
                            ? breadCrumbItems[i].capitalize.toString()
                            : capitalize(breadCrumbItems[i].substring(1)),
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.apply(fontWeightDelta: -1),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        SizedBox(height: TSizes.sm),

        /// Heading of the page
        Row(
          children: [
            if (returnToPreviousScreen)
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Iconsax.arrow_left),
              ),
            if (returnToPreviousScreen)
              SizedBox(height: TSizes.spaceBetweenItems),
            TPageHeading(heading: heading),
          ],
        ),
      ],
    );
  }
}

/// Funvtion to capitalize the first letter of a string
String capitalize(String a) {
  return a.isEmpty ? '' : a[0].toUpperCase() + a.toString();
}
