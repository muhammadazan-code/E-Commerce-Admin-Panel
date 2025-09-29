import 'package:e_commerce_web/common/widgets/layouts/sidebars/controller/sidebar_controller.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class TMenuItems extends StatelessWidget {
  const TMenuItems({
    super.key,
    required this.route,
    required this.icon,
    required this.itemName,
  });
  final String route;
  final IconData icon;
  final String itemName;
  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());
    return InkWell(
      onTap: () => menuController.menuOnTap(route),
      onHover: (hovering) => hovering
          ? menuController.changeHoverItems(route)
          : menuController.changeHoverItems(''),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color:
                  (menuController.isHovering(route) ||
                      menuController.isActive(route))
                  ? TColor.primaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Icons
                Padding(
                  padding: const EdgeInsets.only(
                    left: TSizes.lg,
                    top: TSizes.md,
                    bottom: TSizes.md,
                    right: TSizes.md,
                  ),
                  child: menuController.isActive(route)
                      ? Icon(icon, color: TColor.white, size: 22)
                      : Icon(
                          icon,
                          size: 22,
                          color: menuController.isHovering(route)
                              ? TColor.white
                              : TColor.darkGrey,
                        ),
                ),

                /// Text
                if (menuController.isHovering(route) ||
                    menuController.isActive(route))
                  Flexible(
                    child: Text(
                      itemName,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.apply(color: TColor.white),
                    ),
                  )
                else
                  Flexible(
                    child: Text(
                      itemName,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.apply(color: TColor.darkGrey),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
