import 'package:e_commerce_web/common/widgets/container/t_rounded_container.dart';
import 'package:e_commerce_web/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_web/features/media/controller/media_controller.dart';
import 'package:e_commerce_web/features/media/screen.media/widgets/folder_dropdown.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/enums.dart';
import 'package:e_commerce_web/utils/constants/image_strings.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      () => controller.showImageUploaderSection.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Drag and Drop Area
                TRoundedContainer(
                  radius: 10,
                  showBorder: true,
                  height: 250,
                  backgroundColor: TColor.softGrey,
                  borderColor: TColor.borderPrimary,
                  width: double.infinity,
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            DropzoneView(
                              mime: ['image/jpeg', 'image/png'],
                              cursor: CursorType.Default,
                              operation: DragOperation.copy,
                              onLeave: () => print("Zone left"),
                              onLoaded: () => print("Zone loaded"),
                              onHover: () => print("Zone Hover"),
                              onError: (ev) => print("Zone error $ev"),
                              onCreated: (ctrl) =>
                                  controller.dropzoneViewController = ctrl,
                              onDrop: (file) => print(file),
                              onDropInvalid: (ev) =>
                                  print("Zone invalid MINE: $ev"),
                              onDropMultiple: (value) async {
                                print("Zone drop multiple: $value");
                              },
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  TImagePath.defaultImage,
                                  height: 50,
                                  width: 50,
                                ),
                                SizedBox(height: TSizes.spaceBetweenItems),
                                Text("Drag and Drop Images here"),
                                SizedBox(height: TSizes.spaceBetweenItems),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text("Select Images"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// Locally selected Images
                SizedBox(height: TSizes.spaceBetweenItems),
                TRoundedContainer(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  width: double.infinity,
                  height: 328,
                  radius: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Folders Dropdown
                          Row(
                            children: [
                              Text(
                                "Select Folder",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
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

                          /// Upload & Remove Buttons
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text("Remove All"),
                              ),
                              SizedBox(width: TSizes.spaceBetweenItems),
                              TDeviceUtilities.isMobileScreen(context)
                                  ? const SizedBox.shrink()
                                  : SizedBox(
                                      width: TSizes.buttonWidth,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Upload"),
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: TSizes.spaceBetweenSections),
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
                    ],
                  ),
                ),
                SizedBox(height: TSizes.spaceBetweenSections),
              ],
            )
          : SizedBox.shrink(),
    );
  }
}
