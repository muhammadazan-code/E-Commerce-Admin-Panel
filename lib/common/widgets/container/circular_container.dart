import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding,
    this.margin,
    this.child,
    this.showBorder = false,
    this.borderColor = TColor.borderPrimary,
    this.backgroundColor = TColor.white,
  });

  final double width;
  final double height;
  final double radius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget? child;
  final Color backgroundColor;
  final bool showBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: BoxBorder.all(
          color: showBorder ? borderColor : Colors.transparent,
        ),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
