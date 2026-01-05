import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.showBorder = false,
    this.radius = 400,
    this.borderColor = TColor.borderPrimary,
    this.backgroundColor = TColor.white,
    this.margin,
    this.padding,
  });
  final Widget? child;
  final double width;
  final double height;
  final bool showBorder;
  final double radius;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
