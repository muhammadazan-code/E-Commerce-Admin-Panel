import 'package:data_table_2/data_table_2.dart';
import 'package:e_commerce_web/common/widgets/container/t_rounded_container.dart';
import 'package:e_commerce_web/features/shop/controller.dashboard/dashboard_controller.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final order = DashboardController.orders[index];
    return DataRow2(
      cells: [
        DataCell(
          Text(
            order.id,
            style: Theme.of(
              Get.context!,
            ).textTheme.bodyLarge!.apply(color: TColor.primaryColor),
          ),
        ),
        DataCell(Text(order.formattedOrderDate)),
        DataCell(Text('5 items')),
        DataCell(
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: TRoundedContainer(
              showBorder: false,
              radius: TSizes.cardRadiusSm,
              padding: EdgeInsets.symmetric(
                vertical: TSizes.xs,
                horizontal: TSizes.md,
              ),
              backgroundColor: THelperFunctions.getOrderStatusColor(
                status: order.orderStatus,
              ).withOpacity(0.1),
              child: Text(
                order.orderStatus.name.capitalize.toString(),
                style: TextStyle(
                  color: THelperFunctions.getOrderStatusColor(
                    status: order.orderStatus,
                  ),
                ),
              ),
            ),
          ),
        ),
        DataCell(Text('\$${order.totalAmount}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => DashboardController.orders.length;

  @override
  int get selectedRowCount => 0;
}
