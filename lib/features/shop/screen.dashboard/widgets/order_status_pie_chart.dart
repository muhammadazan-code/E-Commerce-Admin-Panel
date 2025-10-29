import 'package:e_commerce_web/common/widgets/container/t_circular_container.dart';
import 'package:e_commerce_web/features/shop/controller.dashboard/dashboard_controller.dart';
import 'package:e_commerce_web/utils/constants/colors.dart';
import 'package:e_commerce_web/utils/constants/enums.dart';
import 'package:e_commerce_web/utils/constants/sizes.dart';
import 'package:e_commerce_web/utils/helpers/helper_functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrderStatusPieChart extends StatelessWidget {
  const OrderStatusPieChart({super.key, this.width = 800, this.height = 508});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController.instance;
    return TCircularContainer(
      width: width,
      height: height,
      radius: 10,
      showBorder: true,
      borderColor: TColor.darkGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Status",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: TSizes.sm),

            /// Graph
            SizedBox(
              height: 250,
              child: PieChart(
                PieChartData(
                  sections: controller.orderStatusData.entries.map((entry) {
                    final status = entry.key;
                    final count = entry.value;
                    return PieChartSectionData(
                      showTitle: true,
                      title: count.toString(),
                      value: count.toDouble(),
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: TColor.white,
                      ),
                      radius: 80,
                      color: THelperFunctions.getOrderStatusColor(
                        status: status,
                      ),
                    );
                  }).toList(),
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      /// Handle Touch event if needed
                    },
                    enabled: true,
                  ),
                ),
              ),
            ),

            /// Show status and Color Meta
            SizedBox(
              width: double.infinity,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Orders')),
                  DataColumn(label: Text('Totals')),
                ],
                rows: controller.orderStatusData.entries.map((entry) {
                  final OrderStatus status = entry.key;
                  final int count = entry.value;
                  final double totalAmount =
                      controller.totalAmount[status] ?? 0;
                  return DataRow(
                    cells: [
                      DataCell(
                        Row(
                          spacing: 2,
                          children: [
                            TCircularContainer(
                              width: 20,
                              height: 20,
                              backgroundColor:
                                  THelperFunctions.getOrderStatusColor(
                                    status: status,
                                  ),
                            ),
                            Text(controller.getDisplayStatusName(status)),
                          ],
                        ),
                      ),
                      DataCell(Text(count.toString())),
                      DataCell(Text('\$${totalAmount.toStringAsFixed(2)}')),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
