import 'package:e_commerce_web/common/widgets/container/t_rounded_container.dart';
import 'package:e_commerce_web/common/widgets/section_heading/t_section_heading.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TDashboardCard extends StatelessWidget {
  const TDashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.color = TColor.success,
    required this.state,
    this.onTap,
    required this.height,
    required this.width,
    required this.radius,
  });
  final double height;
  final double width;
  final double radius;
  final String title, subtitle;
  final IconData icon;
  final Color? color;
  final int state;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: TRoundedContainer(
        showBorder: true,
        width: width,
        height: height,
        radius: radius,
        onPressed: onTap,
        padding: EdgeInsets.all(TSizes.sm),
        child: Column(
          children: [
            /// Heading
            TSectionHeading(title: title, textColor: TColor.textSecondary),
            SizedBox(height: TSizes.spaceBetweenItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                /// Right Side States
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      /// Indicator
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(icon, color: color, size: TSizes.iconSm),
                            Text(
                              '$state%',
                              style: Theme.of(context).textTheme.titleLarge!
                                  .apply(
                                    color: color,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: Text(
                          'Compared to Dec 2025',
                          style: Theme.of(context).textTheme.labelMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
