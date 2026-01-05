import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_web/common/widgets/layouts/sidebars/menu/menu_items.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/enums.dart';
import 'package:e_commerce_web/utils/constants/image_strings.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSidebars extends StatelessWidget {
  const TSidebars({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: TColor.white,
          border: Border(right: BorderSide(color: TColor.grey, width: 1)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///Image
              TRoundedImage(
                width: 100,
                height: 100,
                imageType: ImageType.assets,
                fit: BoxFit.cover,
                image: TImagePath.darkAppLogo,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: TSizes.spaceBetweenSections),
              Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Heading
                    Text(
                      "MENU",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2),
                    ),

                    ///Menu Items
                    TMenuItems(
                      icon: Iconsax.status,
                      itemName: 'Dashboard',
                      route: TRoutes.dashboard,
                    ),
                    TMenuItems(
                      icon: Iconsax.image,
                      itemName: 'Media',
                      route: TRoutes.media,
                    ),
                    TMenuItems(
                      icon: Iconsax.picture_frame,
                      itemName: 'Banners',
                      route: TRoutes.secondScreenWithUID,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
