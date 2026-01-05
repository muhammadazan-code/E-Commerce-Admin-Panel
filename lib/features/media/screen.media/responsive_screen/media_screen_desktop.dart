import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/common/widgets/breadcrumbs/bread_crumbs_with_header.dart';
import 'package:e_commerce_web/features/media/controller/media_controller.dart';
import 'package:e_commerce_web/features/media/screen.media/widgets/media_content.dart';
import 'package:e_commerce_web/features/media/screen.media/widgets/media_uploader.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';

class DesktopMediaScreen extends StatelessWidget {
  const DesktopMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return Scaffold(
      backgroundColor: TColor.grey,
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
                    breadCrumbItems: [TRoutes.login, 'Media Screen'],
                  ),

                  /// Toogle Images Section Button
                  SizedBox(
                    width: TSizes.buttonWidth * 1.5,
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          controller.showImageUploaderSection.value =
                              !controller.showImageUploaderSection.value,
                      icon: Icon(Iconsax.cloud_add),
                      label: Text("Upload Images"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBetweenSections),

              /// Upload Arena
              MediaUploader(),

              /// Media
              MediaContent(),
            ],
          ),
        ),
      ),
    );
  }
}
