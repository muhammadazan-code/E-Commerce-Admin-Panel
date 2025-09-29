import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_web/common/widgets/shimmer_effect/shimmer_effect_widget.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.border,
    this.overlayColor,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    required this.image,
  });
  final double width;
  final double height;
  final Color? overlayColor;
  final double padding;
  final bool isNetworkImage;
  final BoxFit fit;
  final Color? backgroundColor;
  final String image;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: dark ? TColor.black : TColor.white,
        borderRadius: BorderRadius.circular(100),
        border: border,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, progress) =>
                      TShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Image(
                  image: isNetworkImage
                      ? NetworkImage(image)
                      : AssetImage(image),
                ),
        ),
      ),
    );
  }
}
