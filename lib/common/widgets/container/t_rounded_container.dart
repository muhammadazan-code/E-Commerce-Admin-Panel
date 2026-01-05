import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 100,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.child,
    this.showBorder = false,
    this.borderColor = TColor.borderPrimary,
    this.backgroundColor = TColor.white,
    this.onPressed,
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
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }
}
