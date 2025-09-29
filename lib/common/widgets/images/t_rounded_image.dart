import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_web/common/widgets/shimmer_effect/shimmer_effect_widget.dart';
import 'package:e_commerce_web/utils/constants/enums.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.appplyImageRadius = true,
    this.fit = BoxFit.contain,
    this.border,
    this.borderRadius = TSizes.md,
    this.padding = TSizes.sm,

    this.image,
    this.file,
    this.backgroundColor,
    this.overlayColor,
    this.margin,
    this.memoryImage,
    required this.imageType,
  });
  final ImageType imageType;
  final double width, height, padding;
  final String? image;
  final File? file;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? overlayColor;
  final double? margin;
  final BoxBorder? border;
  final BoxFit? fit;
  final bool appplyImageRadius;
  final Uint8List? memoryImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin != null ? EdgeInsets.all(margin!) : null,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: border,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: _buildImageWidget(),
    );
  }

  Widget _buildImageWidget() {
    Widget imageWidget;
    switch (imageType) {
      case ImageType.network:
        imageWidget = _buildNetworkImage();
        break;
      case ImageType.assets:
        imageWidget = _buildAssetWidget();
        break;
      case ImageType.file:
        imageWidget = _buildFileImage();
        break;
      case ImageType.memory:
        imageWidget = _buildMemoryWidget();
        break;
    }

    /// Apply ClipRRect directly to the image widget
    return ClipRRect(
      borderRadius: appplyImageRadius
          ? BorderRadius.circular(borderRadius)
          : BorderRadius.zero,
      child: imageWidget,
    );
  }

  Widget _buildAssetWidget() {
    if (image != null) {
      /// Display image from assets using Image Widget
      return Image(image: AssetImage(image!), color: overlayColor, fit: fit);
    } else {
      return Container();
    }
  }

  Widget _buildFileImage() {
    if (file != null) {
      /// Display image from assets using Image Widget
      return Image(image: FileImage(file!), color: overlayColor, fit: fit);
    } else {
      return Container();
    }
  }

  Widget _buildNetworkImage() {
    if (image != null) {
      /// Display image from assets using Image Widget
      return CachedNetworkImage(
        imageUrl: image!,
        fit: fit,
        color: overlayColor,
        errorWidget: (context, url, error) => Icon(Icons.error),
        progressIndicatorBuilder: (context, url, progress) =>
            TShimmerEffect(width: width, height: height),
      );
    } else {
      return Container();
    }
  }

  Widget _buildMemoryWidget() {
    if (memoryImage != null) {
      /// Display image from assets using Image Widget
      return Image(
        image: MemoryImage(memoryImage!),
        color: overlayColor,
        fit: fit,
      );
    } else {
      return Container();
    }
  }
}
