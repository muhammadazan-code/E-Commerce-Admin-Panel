import 'package:e_commerce_web/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/enums.dart';
import 'package:e_commerce_web/utils/constants/image_strings.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key, this.scaffoldKey});
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColor.white,
        border: Border(bottom: BorderSide(width: 1, color: TColor.grey)),
      ),
      padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
      child: AppBar(
        /// Mobile Menu
        leading: !TDeviceUtilities.isDesktopScreen(context)
            ? IconButton(
                onPressed: () => scaffoldKey!.currentState?.openDrawer(),
                icon: Icon(Iconsax.menu),
              )
            : null,

        /// Search Fields
        title: TDeviceUtilities.isDesktopScreen(context)
            ? SizedBox(
                width: 488,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.search_normal),
                    hintText: "Search anything....",
                  ),
                ),
              )
            : null,

        /// Actions
        actions: [
          if (!TDeviceUtilities.isDesktopScreen(context))
            IconButton(onPressed: () {}, icon: Icon(Iconsax.search_normal)),

          /// Notification Icon
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification)),
          const SizedBox(width: TSizes.spaceBetweenItems / 2),

          /// User Data
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TRoundedImage(
                width: 48,
                height: 40,
                padding: 2,
                imageType: ImageType.assets,
                image: TImagePath.userImage,
              ),
              SizedBox(width: TSizes.sm),

              /// Name and Email
              if (!TDeviceUtilities.isMobileScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Code with Azan',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Coding with Azan',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(TDeviceUtilities.getAppBarHeight() + 15);
}
