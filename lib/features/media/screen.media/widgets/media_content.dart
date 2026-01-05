import 'package:e_commerce_web/common/widgets/container/t_rounded_container.dart';
import 'package:e_commerce_web/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_web/features/media/controller/media_controller.dart';
import 'package:e_commerce_web/features/media/screen.media/widgets/folder_dropdown.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/enums.dart';
import 'package:e_commerce_web/utils/constants/image_strings.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return TRoundedContainer(
      height: 421,
      padding: EdgeInsets.all(TSizes.defaultSpace),
      width: double.infinity,
      radius: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Media Images Header
          Row(
            children: [
              Text(
                "Select Folder",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(width: TSizes.spaceBetweenItems),
              MediaFolderDropDown(
                onChanged: (MediaCategory? newValue) {
                  if (newValue != null) {
                    controller.selectedPath.value = newValue;
                  }
                },
              ),
            ],
          ),

          SizedBox(height: TSizes.spaceBetweenSections),

          /// Show Media
          Wrap(
            alignment: WrapAlignment.start,
            spacing: TSizes.spaceBetweenItems / 2,
            runSpacing: TSizes.spaceBetweenItems / 2,
            children: [
              TRoundedImage(
                imageType: ImageType.assets,
                height: 90,
                width: 90,
                padding: TSizes.sm,
                image: TImagePath.payPal,
                backgroundColor: TColor.primaryBackground,
              ),
              TRoundedImage(
                imageType: ImageType.assets,
                height: 90,
                width: 90,
                padding: TSizes.sm,
                image: TImagePath.payPal,
                backgroundColor: TColor.primaryBackground,
              ),
              TRoundedImage(
                imageType: ImageType.assets,
                height: 90,
                width: 90,
                padding: TSizes.sm,
                image: TImagePath.payPal,
                backgroundColor: TColor.primaryBackground,
              ),
              TRoundedImage(
                imageType: ImageType.assets,
                height: 90,
                width: 90,
                padding: TSizes.sm,
                image: TImagePath.payPal,
                backgroundColor: TColor.primaryBackground,
              ),
              TRoundedImage(
                imageType: ImageType.assets,
                height: 90,
                width: 90,
                padding: TSizes.sm,
                image: TImagePath.payPal,
                backgroundColor: TColor.primaryBackground,
              ),
              TRoundedImage(
                imageType: ImageType.assets,
                height: 90,
                width: 90,
                padding: TSizes.sm,
                image: TImagePath.payPal,
                backgroundColor: TColor.primaryBackground,
              ),
            ],
          ),

          /// Load More Media Button
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: TSizes.spaceBetweenSections,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: TSizes.buttonWidth,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text("Load More"),
                    icon: Icon(Iconsax.arrow_down),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
